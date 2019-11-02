rudash_modules = Dir.entries('./lib/rudash').select do |filename|
  filename.include?('.rb')
end

rudash_modules.each do |r_module|
  require_relative "./rudash/#{r_module}"
end

### Utils Requires
require_relative './utils/index.rb'
require_relative './utils/dynamic_args_count.rb'
require_relative './utils/path_resolver.rb'
require_relative './utils/subset_deep_match.rb'
require_relative './utils/nested_path_creator.rb'
require_relative './utils/chain_wrapper.rb'

# This is the exposed Gem class that contains all Rudash methods.
# New methods can use already implemented methods by refering to "self"
# in the method if and only if the method get extended into the R_ class.

# rubocop:disable Naming/ClassAndModuleCamelCase
class R_
  extend Rudash::Default
end
# rubocop:enable Naming/ClassAndModuleCamelCase
