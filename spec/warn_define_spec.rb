require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.dirname(__FILE__) + '/../lib/faetr/warn_define'

describe Class do
  describe "warn_define" do
    before(:all) do
      @err, @out = $stderr, $stdout
      @define    = lambda { |m| Object.warn_define(m.to_sym) { p m } }
    end
    
    before { $stderr, $stdout = StringIO.new, StringIO.new }
    after  { $stderr, $stdout = @err, @out}
    
    context "when the method already exists" do
      before do
        @define[:nil?]
        $stderr.rewind
      end
      
      it "should print out a warning" do
        $stderr.read.should_not == ""
      end
      
      it "should leave the original method intact" do
        Object.nil?.should == false
      end
    end
    
    context "when the method does not exist" do
      before do
        @define[:foobaz]
        Object.foobaz
        $stdout.rewind
      end
      
      it "should define the method" do
        $stdout.read.chomp.should == ":foobaz"
      end
      
      it "should not print out a warning" do
        $stderr.read.chomp.should == ""
      end
    end
  end
end
