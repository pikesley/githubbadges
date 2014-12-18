require File.join(File.dirname(__FILE__), 'lib/github_badges.rb')
require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
Cucumber::Rake::Task.new
RSpec::Core::RakeTask.new

task :default => [:spec, :cucumber, 'coveralls:push']
