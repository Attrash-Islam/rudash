module Rudash
  module Initial
    def initial(array)
      return [] unless array.is_a?(Array)

      *initial, _last = array
      initial
    end
  end
end
