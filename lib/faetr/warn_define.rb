class Class
  def warn_define(method, &block)
    if instance_methods.include?(method.to_s)
      $stderr.puts "#{self.inspect}##{method.to_s} is already defined"
    else
      define_method(method, &block)
    end
  end
end