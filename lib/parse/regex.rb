require 'awesome_print'

WIKI_OUTER = /(\A[^<]+|[^<>\n]+\z)/
WIKI_INNER = /<\/[^>]*>\n([^<]+)</

TABLE = /\{\|(.*)\|\}/m
TABLE_CAPTION = /\|\+(.*)/
TABLE_ROW = /\|-\s((?:\|[^-\|]+)*)/
TABLE_COLUMN = /[\|]{1,2}([^\|]*)/