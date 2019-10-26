module Rudash
  module Map
    def map(collection, *rest_args)
      iteratee_fn = self.head(rest_args) || self.method(:identity)
      col = collection.is_a?(String) ? collection.split('') : collection

      return self.map(collection, ->() { nil }) unless Rudash::Utils.is_function?(iteratee_fn)

      if col.is_a?(Array)
        return col.map.with_index { |value, index|
          Rudash::DynamicArgsCount.call(iteratee_fn, value, index)
        }
      elsif col.is_a?(Hash)
        return col.map do |k, v|
          Rudash::DynamicArgsCount.call(iteratee_fn, v, k)
        end
      else
        return []
      end
    end
  end
end
