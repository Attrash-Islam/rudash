module Rudash
  module Some
    def some?(array, filter)
      filtered_arr = self.filter(array, filter)
      !filtered_arr.empty?
    end
  end
end
