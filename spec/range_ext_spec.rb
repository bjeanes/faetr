require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.dirname(__FILE__) + '/../lib/faetr/array_ext'
require File.dirname(__FILE__) + '/../lib/faetr/range_ext'

describe Range do
  describe "#rand" do
    before do
      @range = (1..100)
    end
    
    it "should convert it to an array and call rand on the array" do
      @range.should_receive(:to_a).and_return(array = stub)
      array.should_receive(:rand)
      
      @range.rand
    end
    
    it "should return a random value" do
      range = (1..1000)
      range.rand.should_not == range.rand
    end
  end
end