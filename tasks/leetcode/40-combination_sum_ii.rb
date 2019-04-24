class CombinationFinder
  def initialize
    @result = []
  end

  def call(array, max)
    array_sorted = array.sort

    array_sorted.each_with_index do |el, index|
      compiliator( [el], array_sorted[index+1..-1], max )
    end

    @result.uniq
  end

  private

  def compiliator(start_array, current_array, max_num)
    start_array_sum = start_array.inject(0, :+)

    if start_array_sum == max_num
      @result.push(start_array)
      return
    end

    if start_array_sum > max_num
      return
    end

    if current_array.empty?
      return
    end

    current_array.each do |current_array_item|
      if start_array_sum + current_array_item < max_num
        next
      end

      if start_array_sum + current_array_item == max_num
        @result.push(start_array + [current_array_item])
      end

      break
    end

    current_array.each_with_index do |current_array_item, index|
      compiliator(start_array + [ current_array_item ], current_array[index+1..-1], max_num)
    end
  end

  def log(value)
    p '>>>>>>>>>'
    p value
    p '>>>>>>>>>'
  end
end

# def combination_sum2(candidates, target)
#   CombinationFinder.new.call( candidates, target)
# end

p CombinationFinder.new.call( [1,1,2,5,6,7,10], 9)
p CombinationFinder.new.call( [10,1,2,7,6,1,5], 8)
p CombinationFinder.new.call( [1,1,2,5,6,7,10], 2)
p CombinationFinder.new.call( [1], 1)
p CombinationFinder.new.call( [1,1,2,3,4,4,4,4,4,5], 10)
p CombinationFinder.new.call( [13,23,25,11,7,26,14,11,27,27,26,12,8,20,22,34,27,17,5,26,31,11,16,27,13,20,29,18,7,14,13,15,25,25,21,27,16,22,33,8,15,25,16,18,10,25,9,24,7,32,15,26,30,19], 25)
