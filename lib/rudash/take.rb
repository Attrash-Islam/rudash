module Rudash
  module Take
    def take(array, *rest_args)
      return [] unless self.is_array?(array)

      count = self.head(rest_args) || 1

      begin
        return array.take(count)
      rescue ArgumentError
        return []
      end
    end
  end
end
