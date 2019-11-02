module Rudash
  module Keys
    def keys(value)
      case value
      when Hash
        value.map { |key, _value| key.to_s }
      when Array
        value.map.with_index { |_value, index| index.to_s }
      else
        []
      end
    end
  end
end
