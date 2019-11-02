module Rudash
  module Default
    def number?(value)
      value.is_a?(Numeric)
    end
  end
end
