module Rudash
  module IsEmpty
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
