require_relative 'lib/wiki-this'

task :build do
  system 'gem build wiki-this.gemspec'
end

task :release => :build do
  system "gem push bundler-#{WikiThis::VERSION}"
end