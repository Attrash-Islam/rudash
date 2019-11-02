module Rudash
  module Capitalize
    def capitalize(value)
      value.is_a?(String) ? value.capitalize : value.to_s
    end
  end
end
