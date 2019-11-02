module Rudash
  module Default
    def range(*args)
      start_step = 0
      step_jump = 1
      end_step = 0

      case args.size
      when 0
        return []
      when 1
        end_step = args[0]
      when 2
        start_step, end_step = args
      else
        start_step, end_step, step_jump = args
        step_jump_configured = true
      end

      # step_jump direction (+/-) should be defined by start/end values
      norm_step_jump = (end_step > start_step ? step_jump.abs : -step_jump.abs)

      # illegal behaviors

      return [] if norm_step_jump != step_jump && step_jump_configured

      # End illegal behavior

      iterator = start_step
      result = []

      # calculate loop count
      boundaries = [start_step, end_step]
      max = boundaries.max
      min = boundaries.min
      i = (norm_step_jump.zero? ? (max - min) : ((max - min).to_f / norm_step_jump)).abs
      # end loop calculation

      while i > 0
        result << iterator
        iterator += norm_step_jump
        i -= 1
      end

      result
    end
  end
end
