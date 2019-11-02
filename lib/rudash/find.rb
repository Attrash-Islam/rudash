module Rudash
  module Default
    def find(collection, *rest_args)
      iteratee_fn = self.head(rest_args)
      filtered_arr = self.filter(collection, iteratee_fn)

      filtered_arr[0]
    end
  end
end
