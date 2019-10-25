require_relative './lib/version.rb'

Gem::Specification.new do |s|
    s.name = 'rudash'
    s.version = Rudash::VERSION
    s.date = %q{2019-07-07}
    s.authors = ['Islam Attrash']
    s.email = 'isattrash@gmail.com'
    s.license = 'MIT'
    s.summary = %q{Rudash - Lodash for Ruby Apps}
    s.files = Dir.glob('{lib}/**/*')
    s.require_paths = ['lib']
    s.homepage = 'https://github.com/Attrash-Islam/rudash'
    s.metadata = { 'source_code_uri' => 'https://github.com/Attrash-Islam/rudash' }
    s.required_ruby_version = '>= 2.0'
  end
