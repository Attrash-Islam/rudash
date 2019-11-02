module Rudash
  module Default
    def flow_right(*funs)
      flatten_funs = funs.flatten.reverse

      self.flow(flatten_funs)
    end
  end
end
