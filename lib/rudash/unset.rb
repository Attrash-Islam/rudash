module Rudash
  module Unset
    def unset(object, path)
      return object if !object.is_a?(Hash) && !object.is_a?(Array)

      *initial_path, last = Rudash::PathResolver.resolve(path)

      last_parent = self.get(object, initial_path)

      case last_parent
      when Array
        return false unless Rudash::Utils.match_number?(last)

        last_key = last.to_i
        if last_key > 0 && last_key < last_parent.length
          last_parent.delete_at(last_key)
          true
        else
          false
        end
      when Hash
        last_key = Rudash::Utils.match_number?(last) ? last.to_i : last.to_sym
        if last_parent.key?(last_key)
          last_parent.delete(last_key)
          true
        else
          false
        end
      else
        false
      end
    end
  end
end
