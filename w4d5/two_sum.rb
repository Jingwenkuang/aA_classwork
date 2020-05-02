require "byebug"
#O(n^2)
def two_sum?(arr,target_sum)
    arr.each_with_index do |num1,i|
        arr.each_with_index do |num2,j|
            sum = num1+num2
            if j>i && sum==target_sum
                return true 
            end
        end
    end
    false
                
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false


#sorting
def okay_two_sum?(arr, target_sum)
    return false if arr.length <= 1

    mid = arr.length / 2
    mid_sum = (arr[mid - 1]) + arr[mid]

    return true if mid_sum == target_sum 
    left = arr.take(mid)
    right = arr.drop(mid)
    # debugger 
    if target_sum < mid_sum 
       okay_two_sum?(left, target_sum)
    else
        okay_two_sum?(right, target_sum)
    end

end

#  arr = [-1, 1, 5, -7, 100 ]
#  p okay_two_sum?(arr, 93) # => should be true
#  p okay_two_sum?(arr, 10) # => should be false



#hash_map
#O(n^2)
 def two_sum?(arr, targe_sum)

    hash1 = Hash.new(0)
    arr.each {|ele| hash1[ele] += 1}
# debugger 
    hash1.keys.each_with_index do |num, i|
        result = targe_sum - num 
        if hash1.include?(result) && result != num
            return true
        end
    end
    false 
 end

arr = [-1, 1, 5, -7, 100 ]
 p two_sum?(arr, 93) # => should be true
 p two_sum?(arr, 10) # => should be false
