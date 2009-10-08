# ["ID", "TITLE"].collect(&[:downcase, :to_sym]) # => [:id, :title]
class Array
  warn_define :to_proc do
    Proc.new do |item|
      inject(item) do |mem, obj|
        mem.send(obj)
      end
    end
  end
  
  warn_define :rand do
    self[Kernel.rand(size)]
  end
end