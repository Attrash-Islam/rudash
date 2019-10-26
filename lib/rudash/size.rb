module Rudash
  module Size
    def size(something)
      return 0 if self.is_nil?(something)

      something.size
    end
  end
end
