module Rudash
  module Default
    def update(object, path, *rest_args)
      updater_fn = self.head(rest_args) || self.method(:identity)
      return object unless Rudash::Utils.function?(updater_fn)

      current_value = self.get(object, path)
      self.set(
        object,
        path,
        Rudash::DynamicArgsCount.call(updater_fn, current_value)
      )
      object
    end
  end
end
