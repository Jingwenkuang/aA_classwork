
require 'tdd'


describe "my_uniq" do 
    let(:array) {[1, 3, 4, 9, 7]}
    let(:uniqued_array) {my_uniq(array)}

    it "removes duplicates" do 
        array.each do |ele|
            expect(uniqued_array.count(ele)).to eq(1)
        end
    end

    it "only contains items from original array" do
        uniqued_array.each do |ele|
            expect(array).to include(ele)
        end
    end
    #include matcher
    #expect('a string').to include("a")
    #expect([1,2]).to include(be_odd)
    #expect([1,2]).to include(1,2)

    it "does not modify original array" do
        expect{my_uniq(array)}.to_not change{array}
    end
    #to_not change  / changer matcher
    #expect {do_sth}.to change(object, :attribute)
    #expect {do_sth}.to change{ object.attribute}
end
#----------------------------------------------------
describe "two_sum" do
    let(:array) {[-1, 0, 2, -2, 1]}
    let(:no_pair) {[1, 3, 4]}
    let(:two_zeros) {[0,1,2,0]}

    it "finds a zero_sum pair" do
        expect(two_sum(array)).to eq([[0, 4], [2, 3]])
    end

    it "no pair to return empty array" do 
        expect(two_sum(no_pair)).to eq([])
    end

    it "return pair when two zeros" do
        expect(two_sum(two_zeros)).to eq([[0, 3]])
    end
end

#----------------------------------------------------

describe "my_transpose" do 

    it "transpose a matrix" do 
       array = [ 
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
    ]
        expect(my_transpose(array)).to eq([
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
        ])
    end
end

#----------------------------------------------------

describe "pick_stocks" do 

    it "finds a simple pair" do
        expect(pick_stocks([2,1,0,4,5])).to eq([2, 4])
    end

    it "find a better pair" do
        expect(pick_stocks([3,2,5,0,6])).to eq([3,4])
    end

    it "does not have a good pair" do 
        expect(pick_stocks([4,3,2,1])).to be_nil
    end

end