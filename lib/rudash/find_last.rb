module Rudash
  module Default
    def find_last(collection, *rest_args)
      iteratee_fn = self.head(rest_args)
      filtered_arr = self.filter(collection, iteratee_fn)

      filtered_arr[filtered_arr.length - 1]
    end
  end
end
