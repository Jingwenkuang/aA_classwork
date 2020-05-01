require 'hanoi'

describe Hanoi do 
    subject("hanoi") {Hanoi.new}
    # let (:board) (double('board')) #other class to make a true unit test 
    describe "#move" do
  
        it "allows moving to a empty stack" do 
            expect {hanoi.move(0, 2)}.not_to raise_error
        end

        it "allows moving to a larget stack" do   #?
            hanoi.move(0, 2)
            hanoi.move(0, 1)
            expect { hanoi.move(2, 1) }.not_to raise_error
        end

         it "Invalid moving from an empty stack" do
            expect {hanoi.move(1, 2)}.to raise_error("cannot move from empty stack")
        end

        it "raise error if invalid move" do
            hanoi.move(0, 1)
            expect{hanoi.move(0,1)}.to raise_error("cannot move onto smaller disk")
        end

        
    end

    describe "#won?" do
    it "not won start with" do
        expect(hanoi).not_to be_won
    end

    it "won from stack 1" do
      hanoi.move(0, 1)
      hanoi.move(0, 2)
      hanoi.move(1, 2)
      hanoi.move(0, 1)
      hanoi.move(2, 0)
      hanoi.move(2, 1)
      hanoi.move(0, 1)

      expect(hanoi).to be_won
    end

    it "won from stack 2" do
      hanoi.move(0, 2)
      hanoi.move(0, 1)
      hanoi.move(2, 1)
      hanoi.move(0, 2)
      hanoi.move(1, 0)
      hanoi.move(1, 2)
      hanoi.move(0, 2)

      expect(hanoi).to be_won
    end
end
end
# before(:each) #run before each test 
# before(:all)