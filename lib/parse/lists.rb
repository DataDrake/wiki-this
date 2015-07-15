LIST = /((?:[\*|#]+[^\n\*#]+\n)+)/
LIST_ELEMENT = /([\*|#]+)\s([^\n\*#]+)\n/

$list_type = {'*' => 'ul', '#' => 'ol'}

module WikiThis
  module Parse
    def lists( wiki )
      wiki.gsub!(LIST) do | l |
        list = l.scan(LIST_ELEMENT)
        stack = []
        l = ''
        list.each do |e|
          if e[0].length > stack.length
            stack.push(e[0].chr)
            l = "#{l}<#{$list_type[e[0].chr]}>"
          end
          l = "#{l}<li>#{e[1]}/li>"
          if e[0].length < stack.length
            top = stack.pop
            l = "#{l}<#{$list_type[top]}>"
          end
        end
        until stack.empty? do
          top = stack.pop
          l = "#{l}<#{$list_type[top]}>"
        end
        l
      end
      wiki
    end
  end
end