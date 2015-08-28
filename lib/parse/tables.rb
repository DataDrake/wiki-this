WIKI_TABLE = /\{\|(?:\s*class=["']([^"']*)["']\n)?([^\}]*)\|\}/m
WIKI_TABLE_CAPTION = /\|\+([^\n]*)/
WIKI_TABLE_HEADER = /(?:\|-\n)?((?:[!][^!\|]+)(?:[!|][^-][^!\|]+)*)/
WIKI_TABLE_HEADER_CELL = /[!\|]([^\n]+)\n/
WIKI_TABLE_ROW = /\|-\n((?:\|[^-]+\n)+)/
WIKI_TABLE_CELL = /[\|]{1,2}([^-+\|]+)/
WIKI_TABLE_CELL_STYLE = /[\w]*=["']\w*["']/

module WikiThis
  module Parse
    def tables( wiki )
      wiki.gsub!(WIKI_TABLE) do | t |
        t = t.match(WIKI_TABLE)
        klass = t[1]
        t = t[2]
        table = "<table class='#{klass}'>"
        caption = t.match(WIKI_TABLE_CAPTION)
        unless caption.nil?
          table = "#{table}<caption>#{caption[1]}</caption>"
        end
        header = t.scan(WIKI_TABLE_HEADER)
        unless header.nil?
          table = "#{table}<thead>"
          header.each do |h|
            table = "#{table}<tr>"
            h[0].scan(WIKI_TABLE_HEADER_CELL).each do |d|
              if d[0].include? '|'
                d[0] = d[0].split('|')
                table = "#{table}<th style='#{d[0][0]}'>#{d[0][1]}</th>"
              else
                table = "#{table}<th>#{d[0]}</th>"
              end
            end
            table = "#{table}</tr>"
          end
          table = "#{table}</thead>"
        end
        table = "#{table}<tody>"
        t.scan(WIKI_TABLE_ROW).each do |r|
          table = "#{table}<tr>"
          r[0].scan(WIKI_TABLE_CELL).each do |c|
            table = "#{table}<td>#{c[0]}</td>"
          end
          table = "#{table}<tr>"
        end
        table = "#{table}</tbody></table>"
        table
      end
      wiki
    end
  end
end