require_relative './lib/version.rb'

Gem::Specification.new do |s|
  s.name = 'rudash'
  s.version = Rudash::VERSION
  s.date = '2019-07-07'
  s.authors = ['Islam Attrash']
  s.email = 'isattrash@gmail.com'
  s.license = 'MIT'
  s.summary = 'Rudash - Lodash for Ruby Apps'
  s.files = Dir.glob('{lib}/**/*')
  s.homepage = 'https://github.com/Attrash-Islam/rudash'
  s.metadata = { 'source_code_uri' => 'https://github.com/Attrash-Islam/rudash' }
  s.required_ruby_version = '>= 2.1.0'
end
