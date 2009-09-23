class Range
  # TODO: make this be a no-op for Time/Dates
  warn_define :rand do
    to_a.rand # not optimized, but will work regardless of range time
  end
end