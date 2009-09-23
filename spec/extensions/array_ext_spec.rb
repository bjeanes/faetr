require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Array do
  describe "to_proc" do
    subject do
      ['ID', 'NAME', 'EMAIL']
    end
    
    it "enables Array#map(&[:list, :of, :symbols])" do
      subject.map(&[:downcase, :to_sym]).should == [:id, :name, :email]
    end
  end
  
  describe "rand" do
    subject do
      [1, 2, 3, 4, 5]
    end
    
    it "returns a random array element" do
      subject.should include(subject.rand)
    end
  end
end