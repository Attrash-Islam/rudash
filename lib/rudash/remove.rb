module Rudash
  module Remove
    def remove(array, *rest_args)
      return [] unless array.is_a?(Array)

      predicate_fn = self.head(rest_args)
      removed_items = self.filter(array, predicate_fn)

      array.replace(array - removed_items)
      removed_items
    end
  end
end
