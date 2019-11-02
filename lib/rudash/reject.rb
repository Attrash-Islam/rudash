module Rudash
  module Default
    def reject(collection, *rest_args)
      filter = self.head(rest_args) || self.method(:identity)

      if filter.is_a?(Hash)
        slice_matcher = Rudash::SubsetDeepMatch.subset_deep_match?.call(filter)
        return self.filter(collection, self.negate(slice_matcher))
      elsif Rudash::Utils.function?(filter)
        return self.filter(collection, self.negate(filter))
      else
        return []
      end
    end
  end
end
