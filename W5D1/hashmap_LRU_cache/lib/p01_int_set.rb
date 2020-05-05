class MaxIntSet

  attr_reader :store 
  def initialize(max)
    @store = Array.new(max){false}
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise "invalid" unless is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    raise "invalid" unless is_valid?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    (0..@store.length).include?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % 20 
    @store[i] << num 
    return true 
  end

  def remove(num)
    i = num % 20  
    @store.delete(@store[i])
  end

  def include?(num)
    i = num % 20 
    return true if @store[i].include?(num)
    false 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    n = num % 20 
    return @store[n]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    i = num % 20 
    if num_buckets == count 
      resize!
    end

    unless @store[i].include?(num)
      @store[i] << num 
      @count += 1
    end
    return true 
  end

  def remove(num)
    i = num % 20
    if @store[i].include?(num)
      @store.delete(@store[i])
      @count -= 1
    end
  end

  def include?(num)
    i = num % 20 
    return true if @store[i].include?(num)
    false 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    n = num % 20 
    return @store[n]
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times {@store << []}
  end
end
