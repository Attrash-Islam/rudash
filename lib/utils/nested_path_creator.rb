require_relative '../rudash'
require_relative './index.rb'

# This module will create the nested path when using R_.set on not existing paths
# If we've a hash as { a: 1 } and we run R_.set(hash, 'a.b.c.d', 5) then we want to create the whole
# path ['a', 'b', 'c', 'd'] as embedded hashes.
# If we have some string that matches a number then we create an array.

module Rudash
  module NestedPathCreator
    def self.create_path_if_not_exist(object, resolved_path)
      path = R_.head(resolved_path)
      return nil if !resolved_path.is_a?(Array) || R_.nil?(path)

      path_key = Utils.match_number?(path) ? path.to_i : path.to_sym
      rest_paths = R_.tail(resolved_path)
      next_path = R_.head(rest_paths)
      value = R_.get(object, path)

      if R_.nil?(value) || (!value.is_a?(Hash) && !value.is_a?(Array))
        # If the next path item is numeric (index)
        # then we want to create an array otherwise we create a hash
        object[path_key] = next_path && Utils.match_number?(next_path) ? [] : {}
      end

      # Do the same recursively for next path
      # until getting to the last path item
      self.create_path_if_not_exist(
        R_.get(object, path),
        rest_paths
      )
    end
  end
end
