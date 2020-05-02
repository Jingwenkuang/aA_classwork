require 'byebug'

#phase 1  
#O(nlogn)
def my_min_array(arr)
    return arr if arr.length<=1
    pivot=arr.first
    # debugger
    left=arr[1..-1].select {|ele| ele<arr.first}
    right=arr[1..-1].select {|ele| ele>=arr.first}
    my_min_array(left) + [pivot] + my_min_array(right)

end
def my_min(arr)
    new_arr = my_min_array(arr)
    new_arr.first

end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#phase II
#O(n)
def my_min_2(arr)

    min = arr[0]
    arr.each do |num|
        min = num if num < min 
    end
    min 
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5


#phase I
#O(n^3)
def largest_contiguous_subsum(list)

    sub_arr = []
    (0...list.length).each do |i|
        (0...list.length).each do |j|
           sub_arr << list[i..j].sum if j > i  
        end
    end
    sub_arr.max 
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

#phase II
#O(n)
def largest_contiguous_subsum(list)
    largest = list[0]
    current_sum = 0

    list.each do |num|
        current_sum += num 
        if current_sum > largest
            largest=current_sum

        elsif current_sum<0
            current_sum=0
        end
        
    end
    largest
end

# list = [5, 3, -7, 4, 9]
# p largest_contiguous_subsum(list) # => 8
p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])  #8
p largest_contiguous_subsum([-5, -1, -3]) #-1

#largest 7
#current_sum 7
#num 7
