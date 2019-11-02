module Rudash
  module Default
    def difference(*values)
      diff_reducer = ->(acc, current) {
        return [] unless acc.is_a?(Array)
        return acc unless current.is_a?(Array)

        acc - current
      }

      self.reduce(values, diff_reducer)
    end
  end
end
