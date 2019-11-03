require 'bundler/gem_tasks'
# frozen_string_literal: true

task :clean do
  rm_rf 'gem_modules'
end

task :test do
  sh "ruby ./test-runner.rb '#{ENV['spec']}'"
end

task :lint do
  sh 'rubocop lib test'
end
