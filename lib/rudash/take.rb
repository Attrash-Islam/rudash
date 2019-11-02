module Rudash
  module Default
    def take(array, *rest_args)
      return [] unless self.array?(array)

      count = self.head(rest_args) || 1

      begin
        return array.take(count)
      rescue ArgumentError
        return []
      end
    end
  end
end
