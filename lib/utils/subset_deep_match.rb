require_relative '../rudash'

# This module was written to supply complex subset deep hash and array matching
# in order to give filter, some?, every? and find the ability to deep match with complex hash query.
# See test_filter_hashes_by_deep_hash (test/filter.rb)

module Rudash
  module SubsetDeepMatch
    def self.subset_deep_match?
      subset_matcher = ->(slice, collection) {
        match = true

        # If was called with two arrays then the logic will be to
        # check if every "slice" items exist somehow in the collection
        # without any order consideration.
        if slice.is_a?(Array) && collection.is_a?(Array)
          return R_.every?(slice, ->(slice_val) {
            R_.some?(collection, ->(collection_val) {
              self.subset_deep_match?.call(slice_val, collection_val)
            })
          })
        end

        begin
          R_.each(collection, ->(_v) {
            R_.each(slice, ->(value, key) {
              if value.is_a?(Hash) && collection[key].is_a?(Hash)
                match &= self.subset_deep_match?.call(value, collection[key])
              elsif value.is_a?(Array) && collection[key].is_a?(Array)
                match &= self.subset_deep_match?.call(value, collection[key])
              elsif value != collection[key]
                match = false
              end
            })

            # That was done for performance manners since
            # R_.each don't stop when returning false from the proc
            # so we force it to stop by throwing an exception that we catch later
            # It's the same hack for JavaScript forEach function.
            raise if match == false
          })
        rescue StandardError
          return false
        end

        match
      }

      subset_matcher.curry
    end
  end
end
