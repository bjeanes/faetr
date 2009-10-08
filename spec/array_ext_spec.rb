require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.dirname(__FILE__) + '/../lib/faetr/array_ext'

describe Array do
  describe "#to_proc" do
    # ["ID", "TITLE"].collect(&[:downcase, :to_sym]) # => [:id, :title]
    it "should create a proc object" do
      def test_proc(&proc); proc.class.should == Proc; end
      [:symbol].to_proc.class.should == Proc
      test_proc(&[:symbol])
    end
    
    it "should create a proc that calls the method named after the symbol on the caller" do
      array = [stub, stub, stub]
      array.each do|s|
        s.should_receive(:foo)
        s.should_receive(:bar)
      end
      array.map(&[:foo, :bar])
    end
  end
end