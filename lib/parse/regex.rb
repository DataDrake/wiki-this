require 'awesome_print'

WIKI_OUTER = /(\A[^<]+|[^<>\n]+\z)/
WIKI_INNER = /<\/[^>]*>\n([^<]+)</
LINK = /\[(.*)\]/

AUDIO_LINK = /\[Audio:\s*([^\|\]]+)\s*(?:\|\s*(.*))?\]/
IMAGE_LINK = /\[Image:\s*([^\|\]]+)\s*(?:\|\s*(.*))?\]/
VIDEO_LINK = /\[Video:\s*([^\|\]]+)\s*(?:\|\s*(.*))?\]/
## [Namespace:URN|Label]
INTERNAL_LINK1 = /\[([^:]*):\s*([^\|\]]+)\s*(?:\|\s*(.*))?\]/
## [URN|Label]
INTERNAL_LINK2 = /\[([^:\|\]]+)\s*(?:\|\s*(.*))?\]/
## URN[|LABEL]
EXTERNAL_LINK = /^([^\|\[\]]+)(?:\|\s*(.+))?$/

HEADER = /([=]+)\s*([^=]*)\s*([=]+)/

TABLE = /\{\|(.*)\|\}/m
TABLE_CAPTION = /\|\+(.*)/
TABLE_ROW = /\|-\s((?:\|[^-\|]+)*)/
TABLE_COLUMN = /[\|]{1,2}([^\|]*)/