module Rudash
  module ReduceRight
    def reduce_right(collection, *rest_args)
      reversed_collection = Rudash::Utils.force_reverse(collection)
      self.reduce(reversed_collection, *rest_args)
    end
  end
end
