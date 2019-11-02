module Rudash
  module Default
    def compact(array)
      return [] unless array.is_a?(Array)

      array.compact
    end
  end
end
