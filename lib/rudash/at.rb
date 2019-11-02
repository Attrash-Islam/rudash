module Rudash
  module Default
    def at(object, paths)
      get_mapper = ->(path) {
        self.get(object, path)
      }

      self.map(paths, get_mapper)
    end
  end
end
