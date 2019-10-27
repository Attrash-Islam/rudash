module Rudash
  module Flip
    def flip(a_proc)
      raise 'Expected a Proc/Method' unless Rudash::Utils.function?(a_proc)

      ->(*args) {
        reveresed_args = args.reverse

        a_proc.call(*reveresed_args)
      }
    end
  end
end
