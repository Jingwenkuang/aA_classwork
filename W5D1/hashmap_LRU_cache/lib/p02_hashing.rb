class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index {|ele, idx| sum += (ele*idx).hash}
    sum 
  end
end

class String
  def hash
    sum = 0
    alphabet = ("a".."z").to_a
    self.each_char.with_index do |char,i|
     
      idx = alphabet.index(char.downcase)
      
     sum += (idx * i).hash
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |key, value|
      sum += value.hash
    end
    sum
  end
end
