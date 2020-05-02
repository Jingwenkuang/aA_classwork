#phase I

#O(n!)
def first_anagram?(str1, str2)

    str1_anagram = str1.chars.permutation.map(& :join)
    str1_anagram.include?(str2)
end

# str1 = "cat"
# str2 = "tac"
# p first_anagram?(str1, str2)

#phase II
#O(n^K)  k = 4
def second_anagram?(str1, str2)
    str2 = str2.chars

    str1.each_char do |char|
        return false if !str2.include?(char)
       str2_idx = str2.find_index(char)
        str2.delete_at(str2_idx) if str2_idx < str2.length #delete_at(index)
    end  #length = 0(1)
    str2.empty?  #empty = O(1)
end

# str1 = "cat"
# str2 = "uac"
# p second_anagram?(str1, str2)

#phaseIII
#O(n)
def third_anagram?(str1,str2)
    arr1=str1.chars.sort  #ruby_sort = O(n)
    arr2=str2.chars.sort
    arr1==arr2


end

str1 = "cat"
str2 = "uac"
# p third_anagram?(str1, str2)


#O(n)
def fourth_anagram?(str1,str2)
    hash1=Hash.new(0)
    hash2=Hash.new(0)
    str1.each_char {|char| hash1[char]+=1} #O(n)
    str2.each_char {|char| hash2[char]+=1} #O(m)
    hash1==hash2 #O(n)

end

#0(n^2)
def fourth_anagram?(str1,str2)
    hash1=Hash.new(0)
    str1.each_char {|char| hash1[char]+=1}
    str2.each_char do |char2|
        hash1[char2]+=1
    end
    hash1.each do |key,value|
        return false if value != 2*str1.count(key)
    end
    true

    # str2.each_char do |char|
    #     hash1[char] -= 1
    # end

    # hash1.all?{|k, v| v == 0} #O(n)

end
'cattt'
'tac'

{c:2,a:2,t:6}

str1 = "cat"
str2 = "uac"
p fourth_anagram?(str1, str2)


#[1,4,7,9,10,12] sum=8
#[1,4,7]