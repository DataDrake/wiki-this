require_relative 'lib/wiki-this'

Gem::Specification.new do |s|
  s.name        = 'wiki-this'
  s.version     = WikiThis::VERSION
  s.date        = '2015-07-16'
  s.summary     = 'Converts MediaWiki to HTML'
  s.description = 'Modern Ruby gem for converting MediaWiki to well-structured HTML'
  s.authors     = ['Bryan T. Meyers']
  s.email       = 'bmeyers@datadrake.com'
  s.files       =  Dir.glob('lib/**/*') + %w(LICENSE README.md)
  s.homepage    = 'http://rubygems.org/gems/wiki-this'
  s.license     = 'MIT'
end