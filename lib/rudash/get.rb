module Rudash
  module Get
    def get(hash, path, *_rest_args)
      return nil if !path.is_a?(String) && !path.is_a?(Array)
      return nil if !hash.is_a?(Array) && !hash.is_a?(Hash)

      resolved_path = Rudash::PathResolver.resolve(path)

      get_reducer = ->(acc, current) {
        return nil if acc.nil?

        if acc.is_a?(Array) && Rudash::Utils.match_number?(current)
          acc[current.to_i]
        elsif acc.is_a?(Array) && !Rudash::Utils.match_number?(current)
          nil
        elsif acc.is_a?(Hash)
          acc[current.to_sym] || acc[current]
        else
          nil
        end
      }

      self.reduce(resolved_path, get_reducer, hash)
    end
  end
end
