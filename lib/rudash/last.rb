module Rudash
  module Last
    def last(array)
      return nil unless array.is_a?(Array)

      array.last
    end
  end
end
