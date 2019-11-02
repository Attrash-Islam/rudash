module Rudash
  module Default
    def empty?(value)
      case value
      when Hash, Array
        value.empty?
      else
        true
      end
    end
  end
end
