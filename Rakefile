require File.join(File.dirname(__FILE__), 'lib/github_badges.rb')
require 'cucumber/rake/task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
Cucumber::Rake::Task.new

task :default => [:cucumber, 'coveralls:push']
