require_relative '../rudash'

# This module have the logic of resolving the paths for R_.get, R_.set and R_.update.
# The resolve method will transform the path 'a.b.c.d[0]' to ['a', 'b', 'c', 'd', '0'].
# The mentioned functions above can get the path in either way
# but we want to normilize the string path to the array shape in order to
# make the logic related only to one data structure.

module Rudash
  module PathResolver
    def self.resolve(path)
      normalized_path = path

      normalized_path = normalized_path.join('.') if normalized_path.is_a?(Array)

      filter_not_empty = ->(value) {
        value != ''
      }

      R_.filter(
        normalized_path.split(/[.\[\]]/),
        filter_not_empty
      )
    end
  end
end
