# frozen_string_literal: true

task :clean do
  rm_rf 'gem_modules'
end

task :test do
  sh 'ruby ./test-runner.rb'
end

task :lint do
  sh 'rubocop lib test'
end
