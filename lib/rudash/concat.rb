module Rudash
  module Concat
    def concat(head, *values)
      head_arr = head.is_a?(Array) ? head : [head]
      return head_arr if values.size.zero?

      head_arr + self.concat(*values)
    end
  end
end
