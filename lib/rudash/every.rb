module Rudash
  module Default
    def every?(array, filter)
      filtered_arr = self.filter(array, filter)
      filtered_arr.length == array.length
    end
  end
end
