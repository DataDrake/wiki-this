TABLE = /\{\|(.*)\|\}/m
TABLE_CLASS = /class=["']([^"']*)["']/
TABLE_CAPTION = /\|\+([^\n]*)/
TABLE_HEADER = /\|-\n((?:![^\n]+\n)+)/
TABLE_HEADER_CELL = /!([^\n]+)\n/
TABLE_ROW = /\|-\n((?:\|[^\n-]+\n)+)/
TABLE_CELL = /\|([^-+\|]+)\n/

module WikiThis
  module Parse
    def tables( wiki )
      wiki.gsub!(TABLE) do | t |
        ap t
        klass = t.match(TABLE_CLASS)
        unless klass.nil?
          klass = klass[0]
        end
        table = "<table class='#{klass}'>"
        caption = t.match(TABLE_CAPTION)
        unless caption.nil?
          table = "#{table}<caption>#{caption[1]}</caption>"
        end
        header = t.match(TABLE_HEADER)
        unless header.nil?
          header = header[1]
          table = "#{table}<thead>"
          header.scan(TABLE_HEADER_CELL).each do |d|
            table = "#{table}<th>#{d[0]}</th>"
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