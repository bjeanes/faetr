require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

RANDOM_TEST_COUNT = 100

describe Range do
  describe "rand" do
    
    describe "on String" do
      describe "inclusive" do
        subject do
          'a'..'z'
        end

        it "return a random character within the range" do
          (RANDOM_TEST_COUNT * 3).times do
            subject.should include(subject.rand)
          end
        end

        it "include the start character" do
          f = false
          (RANDOM_TEST_COUNT * 3).times do
            if subject.rand == subject.first
              f = true
              break
            end
          end

          f.should == true
        end

        it "include the end character" do
          f = false
          (RANDOM_TEST_COUNT * 3).times do
            if subject.rand == subject.last
              f = true
              break
            end
          end

          f.should == true
        end
      end

      describe "exclusive" do
        subject do
          'a'...'z'
        end

        it "return a random character within the range" do
          (RANDOM_TEST_COUNT * 3).times do
            subject.should include(subject.rand)
          end
        end

        it "include the start character" do
          f = false
          (RANDOM_TEST_COUNT * 3).times do
            if subject.rand == subject.first
              f = true
              break
            end
          end

          f.should == true
        end

        it "doesn't include the end character" do
          f = false
          (RANDOM_TEST_COUNT * 3).times do
            if subject.rand == subject.last
              f = true
              break
            end
          end

          f.should == false
        end
      end
      
    end
    
    
    describe "on Integers" do
      describe "inclusive" do
        subject do
          (5..10)
        end

        it "return a random number within the range" do
          RANDOM_TEST_COUNT.times do
            subject.should include(subject.rand)
          end
        end

        it "include the start number" do
          f = false
          RANDOM_TEST_COUNT.times do
            if subject.rand == subject.first
              f = true
              break
            end
          end

          f.should == true
        end

        it "include the end number" do
          f = false
          RANDOM_TEST_COUNT.times do
            if subject.rand == subject.last
              f = true
              break
            end
          end

          f.should == true
        end
      end
      
      describe "exclusive" do
        subject do
          (5...10)
        end

        it "return a random number within the range" do
          RANDOM_TEST_COUNT.times do
            subject.should include(subject.rand)
          end
        end

        it "include the start number" do
          f = false
          RANDOM_TEST_COUNT.times do
            if subject.rand == subject.first
              f = true
              break
            end
          end

          f.should == true
        end

        it "doesn't include the end number" do
          f = false
          RANDOM_TEST_COUNT.times do
            if subject.rand == subject.last
              f = true
              break
            end
          end

          f.should_not == true
        end
      end
      
      describe "on Date" do
        describe "inclusive" do
          subject do
            (Date.new(2009, 1, 1)..Date.new(2009, 1, 10))
          end

          it "return a random Date within the range" do
            RANDOM_TEST_COUNT.times do
              subject.should include(subject.rand)
            end
          end

          it "include the start Date" do
            f = false
            RANDOM_TEST_COUNT.times do
              if subject.rand == subject.first
                f = true
                break
              end
            end

            f.should == true
          end

          it "include the end Date" do
            f = false
            RANDOM_TEST_COUNT.times do
              if subject.rand == subject.last
                f = true
                break
              end
            end

            f.should == true
          end
        end

        describe "exclusive" do
          subject do
            (Date.new(2009, 1, 1)...Date.new(2009, 1, 30))
          end

          it "return a random number within the range" do
            RANDOM_TEST_COUNT.times do
              subject.should include(subject.rand)
            end
          end

          it "include the start Date" do
            f = false
            RANDOM_TEST_COUNT.times do
              if subject.rand == subject.first
                f = true
                break
              end
            end

            f.should == true
          end

          it "doesn't include the end Date" do
            f = false
            RANDOM_TEST_COUNT.times do
              if subject.rand == subject.last
                f = true
                break
              end
            end

            f.should_not == true
          end
        end
      end
      
      describe "on Time" do
        describe "inclusive" do
          subject do
            (Time.local(2009, 1, 1, 0, 0, 0)..Time.local(2009, 1, 1, 0, 2, 0))
          end

          it "return a random Date within the range" do
            (RANDOM_TEST_COUNT * 5).times do
              subject.should include(subject.rand)
            end
          end

          it "include the start Time" do
            f = false
            (RANDOM_TEST_COUNT * 5).times do
              if subject.rand == subject.first
                f = true
                break
              end
            end

            f.should == true
          end

          it "include the end Time" do
            f = false
            (RANDOM_TEST_COUNT * 5).times do
              if subject.rand == subject.last
                f = true
                break
              end
            end

            f.should == true
          end
        end

        describe "exclusive" do
          subject do
            (Time.local(2009, 1, 1, 0, 0, 0)...Time.local(2009, 1, 1, 0, 2, 0))
          end

          it "return a random Date within the range" do
            (RANDOM_TEST_COUNT * 5).times do
              subject.should include(subject.rand)
            end
          end

          it "include the start Time" do
            f = false
            (RANDOM_TEST_COUNT * 5).times do
              if subject.rand == subject.first
                f = true
                break
              end
            end

            f.should == true
          end

          it "doesn't include the end Time" do
            f = false
            (RANDOM_TEST_COUNT * 5).times do
              if subject.rand == subject.last
                f = true
                break
              end
            end

            f.should == false
          end
        end
        
      end
    end
  end
end