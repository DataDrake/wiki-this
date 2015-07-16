FORMATTED = /('{2,5})([^']*)\1/

module WikiThis
  module Parse
    def formatting( wiki )
      wiki.gsub!(FORMATTED) do | f |
        s = ''
        f = f.match(FORMATTED)
        case(f[1].length)
          when 2
            s = "<i>#{f[2]}</i>"
          when 3,4
            s = "<b>#{f[2]}</b>"
          when 5
            s = "<i><b>#{f[2]}</b></i>"
        end
        s
      end
      wiki
    end
  end
end