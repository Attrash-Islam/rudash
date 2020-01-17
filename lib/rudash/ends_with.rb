module Rudash
  module Default
    def ends_with?(str, *rest_args)
      case str
      when String
        suffix = self.head(rest_args)
        return false if suffix.nil?

        str.end_with?(suffix.to_s)
      else
        false
      end
    end
  end
end
