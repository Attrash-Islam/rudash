module Rudash
  module IsNumber
    def number?(value)
      value.is_a?(Numeric)
    end
  end
end
