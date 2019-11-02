module Rudash
  module Chain
    def chain(value)
      Rudash::ChainUtils::ChainWrapper.new(value, self)
    end
  end
end
