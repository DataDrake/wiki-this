require 'awesome_print'
require_relative 'formatting'
require_relative 'headers'
require_relative 'links'
require_relative 'lists'
require_relative 'tables'

$base = '/edge'
$media = 'repos'

WIKI_OUTER = /(\A[^<]+|[^<>\n]+\z)/
WIKI_INNER = /<\/[^>]*>\n([^<]+)</

module WikiThis
  module Parse

    def parse2( wiki )
      wiki = formatting(wiki)
      wiki = headers(wiki)
      wiki = links(wiki)
      wiki = lists(wiki)
      wiki = tables(wiki)
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

lists = "* thing 1\n# number 1\n** thing 2\n"

def_lists = "; definitions\n; def 1 : a thing\n; def 2 : a thing 2\n\n"

formatted = "''italic'' '''bold''' ''''bold as well'''' '''''bold and italic'''''"

table = "{| class='wikitable'\n|+ caption thing\n|-\n! header 1\n! header 2\n! header 3\n|-\n| row 1, cell 1\n| row 1, cell 2\n| row 1, cell 3\n|-\n| row 2, cell 1\n| row 2, cell 2\n| row 2, cell 3\n|}\n"

ap header
ap parse( header )

ap links
ap parse( links )

ap lists
ap parse( lists)

ap def_lists
ap parse( def_lists)

ap formatted
ap parse( formatted )

ap table
ap parse( table )