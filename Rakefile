require_relative 'lib/wiki-this'

task :build do
  system 'gem build wiki-this.gemspec'
end

task :install => :build do
	system "sudo gem install -N -l wiki-this-#{WikiThis::VERSION}.gem"
end

task :release => :build do
  system "gem push wiki-this-#{WikiThis::VERSION}.gem"
end