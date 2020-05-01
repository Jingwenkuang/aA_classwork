require 'byebug'
def my_uniq(array)
    uniq = []

    array.each do |ele|
        uniq << ele unless uniq.include?(ele)
    end

    uniq
end

#----------------------------------------------------
def two_sum(array)
    pairs = []

    array.each_with_index do |ele_1, idx_1|
        array.each_with_index do |ele_2, idx_2|
            pairs << [idx_1, idx_2] if ele_1 + ele_2 == 0 && idx_2 > idx_1 
        end
    end
    pairs 
end

#----------------------------------------------------

def my_transpose(array)
    transposed = Array.new(array.length){Array.new(array.length)}

    array.each_with_index do |row, row_idx|
        row.each_with_index do |ele, col_idx|
           
            transposed[col_idx][row_idx] = ele
        end
    end
    transposed 
end


#----------------------------------------------------

# pick the most profitable pair of days  
#[8,2,4,5,6]--> one stock represent the price of different day
#[0,1,2,3,4]--> indices reprensent the days 
# have to buy it before sell it 
# most profitable pair is at index pair [1, 4]
#[1, 4]--> 1 is the buy day, 4 is the sell day. 

def pick_stocks(array)
    profit_pair = nil
    most_profit = 0

    array.each_with_index do |num_1, idx_1|
        array.each_with_index do |num_2, idx_2|
            if idx_2 > idx_1 
# debugger
                 current_pro = num_2 - num_1 
                 if current_pro > most_profit
                    most_profit = current_pro
                    profit_pair = [idx_1, idx_2]
                 end

            end
        end
    end
   profit_pair 
end

p pick_stocks([3,2,5,0,6]) # [3, 4]