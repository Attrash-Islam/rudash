module Rudash
  module Default
    def pick(hash, paths)
      return self.pick(hash, [paths]) unless paths.is_a?(Array)
      return {} unless hash.is_a?(Hash)

      picked_hash = {}

      eacher = ->(path) {
        value = self.get(hash, path)
        self.set(picked_hash, path, value) unless value.nil?
      }

      self.each(paths, eacher)
      picked_hash
    end
  end
end
