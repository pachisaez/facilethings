begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Facilethings'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

#require 'rake/testtask'

#Rake::TestTask.new(:test) do |t|
#  t.libs << 'lib'
#  t.libs << 'test'
#  t.pattern = 'test/**/*_test.rb'
#  t.verbose = false
#end

#task default: :test

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task default: :spec
task test: :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'facilethings'
  ARGV.clear
  IRB.start
end
