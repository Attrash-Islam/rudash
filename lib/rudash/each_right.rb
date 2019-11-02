module Rudash
  module EachRight
    def each_right(collection, *rest_args)
      reversed_collection = Rudash::Utils.force_reverse(collection)

      self.each(reversed_collection, *rest_args)
      collection
    end

    def for_each_right(*args)
      self.each_right(*args)
    end
  end
end
