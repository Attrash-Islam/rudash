module Rudash
  module Union
    def union(*values)

      union_reducer = ->(acc, current) {
        return acc if !current.is_a?(Array) || !acc.is_a?(Array)

        acc | current
      }

      is_array = ->(value) { value.is_a?(Array) }

      arr_values = self.filter(values, is_array)
      head = self.head(arr_values)

      self.reduce(arr_values, union_reducer, head) || []
    end
  end
end
