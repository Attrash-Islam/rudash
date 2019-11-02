module Rudash
  module Default
    def chain(value)
      Rudash::ChainUtils::ChainWrapper.new(value, self)
    end
  end
end
