require_relative 'regex'

$base = '/edge'
$media = 'repos'

module WikiThis
  module Parse

    def parse2( wiki )
      wiki.gsub!(HEADER) do |h|
        if  $1.length == $3.length
          "<h#{$1.length}>#{$2}</h#{$1.length}>"
        else
          h
        end
      end
      wiki.gsub!(LINK) do
        l = $1
        done = nil
        done = l.gsub!(AUDIO_LINK, "<audio controls><source src='#{$media}/\\1'></audio>" ) unless done
        done = l.gsub!(IMAGE_LINK, "<img src='#{$media}/\\1' alt='\\2'>" ) unless done
        done = l.gsub!(VIDEO_LINK, "<video controls><source src='#{$media}/\\1'></video>" ) unless done
        done = l.gsub!(INTERNAL_LINK1, "<a href='#{$base}/\\1/\\2'>\\3</a>" ) unless done
        done = l.gsub!(INTERNAL_LINK2, "<a href='\\1'>\\2</a>" ) unless done
        l.gsub!(EXTERNAL_LINK, "<a href='\\1'>\\2</a>" ) unless done
        l
      end
      wiki
    end

    def parse( wiki )
      wiki.gsub!(WIKI_OUTER) do |w|
        parse2(w)
      end
      wiki.gsub!(WIKI_INNER) do |w|
        parse2(w)
      end
      wiki
    end
  end
end

include WikiThis::Parse

header = "=== This is a header ===\n<code></code>\n== This is another header ==\n<nowiki></nowiki>\n= this is a title ="

links = "[[Audio:thing.png|thing]]\n [[Video:thing.png|thing]]\n [[Image:thing.png|thing]]\n [[P14452:thing.png|thing]]\n [[P14452:thing.png]]\n [[thing.png|thing]]\n [[thing.png]]\n [thing.png]\n [thing.png|thing]\n"

ap header
ap parse( header )

ap links
ap parse( links )