module Rudash
  module ChainUtils
    class ChainWrapper
      attr_reader :value

      def initialize(value, r_)
        @value = value
        @r_ = r_
      end

      def method_missing(method_name, *args, &_block)
        result = @r_.public_send(method_name, @value, *args)
        self.class.new(result, @r_)
      rescue NameError
        raise NameError.new("\"#{method_name}\" doesn't exist in Rudash")
      end
    end
  end
end
