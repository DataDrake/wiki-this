TABLE = /\{\|(?:\s*class=["']([^"']*)["']\n)?([^\}]*)\|\}/m
TABLE_CAPTION = /\|\+([^\n]*)/
TABLE_HEADER = /(?:\|-\n)?((?:[!][^!\|]+)(?:[!|][^-][^!\|]+)*)/
TABLE_HEADER_CELL = /[!\|]([^\n]+)\n/
TABLE_ROW = /\|-\n((?:\|[^-]+\n)+)/
TABLE_CELL = /\|([^-+\|]+)\n/

module WikiThis
  module Parse
    def tables( wiki )
      wiki.gsub!(TABLE) do | t |
        t = t.match(TABLE)
        klass = t[1]
        t = t[2]
        table = "<table class='#{klass}'>"
        caption = t.match(TABLE_CAPTION)
        unless caption.nil?
          table = "#{table}<caption>#{caption[1]}</caption>"
        end
        header = t.scan(TABLE_HEADER)
        unless header.nil?
          table = "#{table}<thead>"
          header.each do |h|
            table = "#{table}<tr>"
            h[0].scan(TABLE_HEADER_CELL).each do |d|
              table = "#{table}<th>#{d[0]}</th>"
            end
            table = "#{table}</tr>"
          end
          table = "#{table}</thead>"
        end
        table = "#{table}<tody>"
        t.scan(TABLE_ROW).each do |r|
          table = "#{table}<tr>"
          r[0].scan(TABLE_CELL).each do |c|
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