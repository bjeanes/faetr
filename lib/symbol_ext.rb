class Symbol
  warn_define :to_proc do
    Proc.new { |item| item.send self }
  end
end