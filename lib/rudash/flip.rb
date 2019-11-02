module Rudash
  module Default
    def flip(a_lambda)
      raise 'Expected a lambda/Method' unless Rudash::Utils.function?(a_lambda)

      ->(*args) {
        reveresed_args = args.reverse

        a_lambda.call(*reveresed_args)
      }
    end
  end
end
