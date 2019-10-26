module Rudash
  module Filter
    def filter(collection, *rest_args)
      predicate_fn = self.head(rest_args) || self.method(:identity)

      if predicate_fn.is_a?(Hash)
        slice_matcher = Rudash::SubsetDeepMatch.subset_deep_match?.call(predicate_fn)
        return self.filter(collection, slice_matcher)
      end

      return [] unless Rudash::Utils.is_function?(predicate_fn)

      if collection.is_a?(Array)
        return collection.select.with_index do |x, idx|
          Rudash::DynamicArgsCount.call(predicate_fn, x, idx)
        end
      elsif collection.is_a?(Hash)
        return collection.select do |k, v|
          Rudash::DynamicArgsCount.call(predicate_fn, v, k)
        end.values
      else
        return []
      end
    end
  end
end
