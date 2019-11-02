module Rudash
  module Default
    def without(array, *values)
      return [] unless array.is_a?(Array)

      self.difference(array, values)
    end
  end
end
