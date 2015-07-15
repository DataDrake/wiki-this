require_relative 'regex'
require_relative 'headers'
require_relative 'links'

$base = '/edge'
$media = 'repos'

module WikiThis
  module Parse

    def parse2( wiki )
      wiki = headers(wiki)
      wiki = links(wiki)
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