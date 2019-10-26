module Rudash
  module DropRight
    def drop_right(array, *rest_args)
      return [] unless self.is_array?(array)

      n = self.head(rest_args) || 1
      return array if n <= 0

      self.take(array, self.size(array) - n)
    end
  end
end
