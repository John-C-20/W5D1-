class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    bucket = key.hash % num_buckets
    if !self.include?(key)
      @store[bucket] << key 
      @count += 1
    end
  end

  def include?(key)
    bucket = key.hash % num_buckets
    @store[bucket].include?(key)
  end

  def remove(key)
    bucket = key.hash % num_buckets
    if include?(key)
      @store[bucket].delete(key) 
      @count -= 1 
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    numbers = @store.flatten 
    @store = Array.new(num_buckets*2) {Array.new}
    numbers.each do |number|
      bucket = number.hash % num_buckets
      @store[bucket] << number 
    end
  end
end
