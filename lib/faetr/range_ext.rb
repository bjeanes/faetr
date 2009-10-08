require 'date'
require 'time'

class Range
  # TODO: make this be a no-op for Time/Dates
  warn_define :rand do
    case first
    when Integer
      Kernel.rand((exclude_end? ? last - 1 : last) - first + 1) + first
    when Date
      first + Kernel.rand((exclude_end? ? last - 1 : last) - first + 1)
    when Time
      first + Kernel.rand((exclude_end? ? last - 1 : last) - first + 1)
    else
      @@rand_warnings ||= {}
      if !@@rand_warnings[first.class.to_s.to_sym]
        $stderr.puts "Falling back to non-optimised Range#rand for unimplemented class #{first.class.to_s}"
        @@rand_warnings[first.class.to_s.to_sym] = true
      end
      to_a.rand
    end
  end
end