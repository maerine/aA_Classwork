require "byebug"
class MaxIntSet
  attr_accessor :store 

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num >= @max || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    if num >= @max || num < 0
      raise "Out of bounds"
    else
      @store[num] = false
    end
  end

  def include?(num)
    if num > @max || num < 0
      raise "Out of bounds"
    elsif @store[num] == false
      return false
    else
      return true
    end
  end

  private

  def is_valid?(num)

  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !self.include?(num)
      @store[num % num_buckets].push(num)
    end
  end

  def remove(num)
    if self.include?(num)
      @store[num].delete(num)
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
    if !self.include?(num)
      @store[num % num_buckets].push(num)
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      @store[num].delete(num)
      @count -= 1
    end 
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private
  attr_accessor :store

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    #@store[num % num_buckets]
  end

  def []=(num, val)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] = val
  end

  def num_buckets
    @store.length
  end

  def resize!(count)
    if @count > @store.length
      new_store = Array.new(num_buckets * 2) { Array.new }

      @store.each do |bucket|
        bucket.each do |num|
          new_store.insert(num)
        end
      end

      @store = new_store
    end
  end

end