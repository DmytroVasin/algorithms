class MinStack
  def initialize
    @min   = Float::INFINITY
    @array = []
  end

  def push(x)
    @array << x
    @min = x if x < @min

    nil
  end

  def pop
    poped_value = @array.pop
    if poped_value == @min
      @min = @array.min || Float::INFINITY
    end

    nil
  end

  def top
    @array[-1]
  end

  def get_min
    @min
  end
end

minStack = MinStack.new
minStack.push(2147483646)
minStack.push(2147483646)
minStack.push(2147483647)
minStack.top
minStack.pop
minStack.get_min
minStack.pop
minStack.get_min
minStack.pop
minStack.push(2147483647)
minStack.top
minStack.get_min
minStack.push(-2147483648)
minStack.top
minStack.get_min
minStack.pop
minStack.get_min
