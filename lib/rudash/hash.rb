module Rudash
  module IsHash
    def hash?(value)
      value.is_a?(Hash)
    end
  end
end
