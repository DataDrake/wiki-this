# wiki-this
Modern Ruby gem for converting MediaWiki to well-structured HTML

## Background
Most of the Ruby community seems to have migrated toward Markdown. This is easy to justify when GitHub uses it as it's core markup language. However, MediaWiki is still one of the most used markup languages in history (Wikipedia, anyone?). Sadly for us, most Ruby MediaWiki parsers have not been completed or updated in recent years. We seek to solve this problem by introducing 'wiki-this', a MediaWiki parser for the future.

## Design
Wiki-this strives to be simple, and easy to use. It has been built upon a carefully crafted set of Regex matching rules. This may not be the most efficient or speedy of implementations, but it promises to be an intriguing design that may be later ported for other markups.

## Supported Features
* Headers
* Links (Internal, External, Audio, Video, Image)
* Lists (Ordered, Unordered, Definition)