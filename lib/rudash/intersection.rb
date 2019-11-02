module Rudash
  module Intersection
    def intersection(*values)
      intersection_reducer = ->(acc, current) {
        return [] if !current.is_a?(Array) || !acc.is_a?(Array)

        acc & current
      }

      self.reduce(values, intersection_reducer, values[0])
    end
  end
end
