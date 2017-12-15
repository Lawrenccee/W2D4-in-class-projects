def naive_solution(arr, window)
  current_max_range = nil

  (0..arr.length - window).each do |idx|
    range = arr[idx...idx + window]
    diff = range.max - range.min
    current_max_range = diff if current_max_range.nil? || diff > current_max_range
  end

  current_max_range

end

p naive_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8



class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @store.push(el)
    if @stack1.empty?
      @stack1.push(el)
      until @stack2.empty?
        @stack1.push(@stack2.pop)
      end
    else
      @stack2.push(el)
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end
    end

    el
  end

  def dequeue
    if @stack1.empty?
      until @stack2.empty?
        @stack1.push(@stack2.pop)
        return @stack1.pop
      end
    else
      until @stack1.empty?
        @stack2.push(@stack1.pop)
        return @stack2.pop
      end
    end
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end
end

class MinMaxStack
  attr_reader :max, :min

  def initialize
    @min = nil
    @max = nil
    @store = []
  end

  def push(el)
    @min = el if @min.nil? || el < @min
    @max = el if @max.nil? || el > @max

    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue
  def initialize
    @stack1 = MinMaxStack.new
    @stack2 = MinMaxStack.new
  end

  def enqueue(el)
    @stack1.push(el)
    if @stack1.empty?
      @stack1.push(el)
      until @stack2.empty?
        @stack1.push(@stack2.pop)
      end
    else
      @stack2.push(el)
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end
    end

    el
  end

  def dequeue
    if @stack1.empty?
      until @stack2.empty?
        @stack1.push(@stack2.pop)
        return @stack1.pop
      end
    else
      until @stack1.empty?
        @stack2.push(@stack1.pop)
        return @stack2.pop
      end
    end
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

  def max
    if @stack1.max > @stack2.max
      @stack1.max
    end

    @stack2.max
  end

  def min
    if @stack1.min < @stack2.min
      @stack1.min
    end

    @stack2.min
  end
end

def optimized_solution(arr, window)
  current_max_range = nil
  minmax = MinMaxStackQueue.new

  (window - 1).times { |el| minmax.enqueue(el) }

  i = window - 1
  while i <= (arr.length - window)
    minmax.enqueue(arr[i])

    diff = minmax.max - minmax.min
    current_max_range = diff if current_max_range.nil? || diff > current_max_range

    minmax.dequeue
    i += 1
  end

  current_max_range
end

p optimized_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
