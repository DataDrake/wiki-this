require 'awesome_print'
require_relative 'formatting'
require_relative 'headers'
require_relative 'links'
require_relative 'lists'
require_relative 'tables'

WIKI_OUTER = /(\A[^<]+|[^<>\n]+\z)/
WIKI_INNER = /<\/[^>]*>\n([^<]+)</

module WikiThis
  module Parse

    def parse2( wiki )
			wiki.gsub!('__NOTOC__','')
			wiki.gsub!('__TOC__','')
      wiki = formatting(wiki)
      wiki = headers(wiki)
      wiki = links(wiki)
      wiki = lists(wiki)
      wiki = tables(wiki)
      wiki
    end

    def parse( wiki , base, base_media)
			$base = base
			$media = base_media
      wiki.gsub!(WIKI_OUTER) do |w|
        parse2(w)
      end
      wiki.gsub!(WIKI_INNER) do |w|
        parse2(w)
      end
      CGI.unescapeHTML(wiki)
    end
  end
end