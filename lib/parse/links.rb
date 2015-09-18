## [ ]
WIKI_LINK = /\[([^\[\]]+|\[.+\])\]/

## [Audio:URN|label]
WIKI_AUDIO_LINK = /\[Audio:\s*([^\|\]]+)\s*(?:\|\s*(.*))?\]/
## [Image:URN|label]
WIKI_IMAGE_LINK = /\[Image:\s*([^\|\]]+)\s*(?:\|\s*(.*))?\]/
## [Video:URN|label]
WIKI_VIDEO_LINK = /\[Video:\s*([^\|\]]+)\s*(?:\|\s*(.*))?\]/

## [Namespace:URN|Label]
WIKI_INTERNAL_LINK1 = /\[([^\[\]:]*):\s*([^\|\]\[]+)\s*(?:\|\s*([^\]\[]*))?\]/
## [URN|Label]
WIKI_INTERNAL_LINK2 = /\[([^:\|\]\[]+)\s*(?:\|\s*(.*))?\]/
## URN[|LABEL]
WIKI_EXTERNAL_LINK = /^([^\|\[\]]+)(?:\|\s*(.+))?$/

module WikiThis
  module Parse
    def links( wiki )
      wiki.gsub!(WIKI_LINK) do
        l = $1
        done = nil
        done = l.gsub!(WIKI_AUDIO_LINK, "<audio controls><source src='#{$media}/\\1'></audio>" ) unless done
        done = l.gsub!(WIKI_IMAGE_LINK, "<img src='#{$media}/\\1' alt='\\2'>" ) unless done
        done = l.gsub!(WIKI_VIDEO_LINK, "<video controls><source src='#{$media}/\\1'></video>" ) unless done
        done = l.gsub!(WIKI_INTERNAL_LINK1) do
					if $3 and not $3.empty?
						"<a href='#{$base}/#{$1}/#{$2}'>#{$3}</a>"
					else
						"<a href='#{$base}/#{$1}/#{$2}'>#{$base}/#{$1}/#{$2}</a>"
					end
				end unless done
        done = l.gsub!(WIKI_INTERNAL_LINK2) do
					if $2 and not $2.empty?
						"<a href='#{$1}'>#{$2}</a>"
					else
						"<a href='#{$1}'>#{$1}</a>"
					end
				end unless done
        l.gsub!(WIKI_EXTERNAL_LINK) do
					if $2 and not $2.empty?
						"<a href='#{$1}'>#{$2}</a>"
					else
						"<a href='#{$1}'>#{$1}</a>"
					end
				end unless done
        l
      end
      wiki
    end
  end
end