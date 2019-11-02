module Rudash
  module Default
    def curry(a_lambda)
      a_lambda.is_a?(Proc) ? a_lambda.curry : (raise 'Expected a Lambda')
    end
  end
end
