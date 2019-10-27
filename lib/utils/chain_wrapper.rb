module Rudash
  module ChainUtils
    class ChainWrapper
      attr_reader :value

      def initialize(value, ru_)
        @value = value
        @ru_ = ru_
      end

      def method_missing(method_name, *args, &_block)
        result = @ru_.public_send(method_name, @value, *args)
        self.class.new(result, @ru_)
      rescue NameError
        raise NameError, "\"#{method_name}\" doesn't exist in Rudash"
      end
    end
  end
end
