module Rudash
  module Negate
    def negate(a_proc)
      raise 'Expected a Proc/Method' unless Rudash::Utils.is_function?(a_proc)

      ->(*args) { !a_proc.call(*args) }
    end
  end
end
