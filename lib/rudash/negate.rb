module Rudash
  module Default
    def negate(a_lambda)
      raise 'Expected a lambda/Method' unless Rudash::Utils.function?(a_lambda)

      ->(*args) { !a_lambda.call(*args) }
    end
  end
end
