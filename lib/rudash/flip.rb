module Rudash
  module Flip
    def flip(a_proc)
      raise 'Expected a Proc/Method' unless Rudash::Utils.is_function?(a_proc)

      ->(*args) {
        reveresed_args = args.reverse

        a_proc.(*reveresed_args)
      }
    end
  end
end
