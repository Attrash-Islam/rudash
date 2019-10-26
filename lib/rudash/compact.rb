module Rudash
  module Compact
    def compact(array)
      return [] unless array.is_a?(Array)

      array.compact
    end
  end
end
