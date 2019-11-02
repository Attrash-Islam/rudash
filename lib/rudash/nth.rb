module Rudash
  module Default
    def nth(array, *rest_args)
      n = self.head(rest_args) || 0
      return self.nth(array, 0) unless self.number?(n)
      return nil unless self.array?(array)

      array[n]
    end
  end
end
