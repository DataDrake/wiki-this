HEADER = /([=]+)\s*([^=]*)\s*([=]+)/

module WikiThis
  module Parse
    def headers( wiki )
      wiki.gsub!(HEADER) do |h|
        if  $1.length == $3.length
          "<h#{$1.length}>#{$2}</h#{$1.length}>"
        else
          h
        end
      end
      wiki
    end
  end
end