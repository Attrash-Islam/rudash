module Rudash
  module Default
    def head(array)
      return nil unless array.is_a?(Array)

      array.first
    end

    def first(*args)
      self.head(*args)
    end
  end
end
