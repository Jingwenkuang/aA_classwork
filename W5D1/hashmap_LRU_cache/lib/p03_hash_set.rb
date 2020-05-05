class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    i = key.hash % num_buckets

    resize! if count == num_buckets
    @store[i] << key
    @count += 1 
  end

  def include?(key)
    i = key.hash % num_buckets
    @store[i].include?(key)
  end

  def remove(key)
    i = key.hash % num_buckets 
    if include?(key)
    @store[i].delete(key) 
    @count -= 1 
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    @store[i] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times {@store << []}
  end
end
