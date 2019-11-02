module Rudash
  module Default
    def flow(*funs)
      flatten_funs = funs.flatten

      ->(*args) {
        self.reduce(flatten_funs, ->(acc, fn) {
          Rudash::DynamicArgsCount.call(fn, *self.concat(acc))
        }, args)
      }
    end
  end
end
