module Rudash
  module Set
    def set(object, path, value)
      return object if !object.is_a?(Hash) && !object.is_a?(Array)

      resolved_path = Rudash::PathResolver.resolve(path)
      Rudash::NestedPathCreator.create_path_if_not_exist(object, resolved_path)

      *initial_path, last = resolved_path

      last_key = Rudash::Utils.match_number?(last) ? last.to_i : last.to_sym

      if initial_path.size.zero?
        object[last_key] = value
        return object
      end

      last_parent = self.get(object, initial_path)
      last_parent[last_key] = value
      object
    end
  end
end
