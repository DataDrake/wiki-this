WIKI_LIST = /((?:[*#]+[^\n*#]+\n)+)/
WIKI_LIST_ELEMENT = /([*#]+)\s([^\n*#]+)/

WIKI_DEF_LIST = /((?:^[;:].*\n)+)/
WIKI_DEF_ELEMENT = /([:;])([^\1\n]+)\n/

$list_type = {'*' => 'ul', '#' => 'ol'}

module WikiThis
  module Parse
    def lists( wiki )
      wiki.gsub!(WIKI_LIST) do | l |
        list = l.scan(WIKI_LIST_ELEMENT)
        stack = []
        l = ''
        list.each do |e|
          if e[0].length > stack.length
            stack.push(e[0].chr)
            l = "#{l}<#{$list_type[e[0].chr]}>"
          end
          l = "#{l}<li>#{e[1]}</li>"
          if e[0].length < stack.length
            top = stack.pop
            l = "#{l}</#{$list_type[top]}>"
          end
        end
        until stack.empty? do
          top = stack.pop
          l = "#{l}</#{$list_type[top]}>"
        end
        l
      end
      wiki.gsub!(WIKI_DEF_LIST) do | l |
				list = '<dl>'
				list += l.gsub(WIKI_DEF_ELEMENT) do
					if $1.eql? ';'
						e = '<dt>'
					else
						e = '<dd>'
					end
					e += $2
					if $1.eql? ';'
						e += '<dt>'
					else
						e += '<dd>'
					end
					e
				end
        list + '</dl>'
      end
      wiki
    end
  end
end