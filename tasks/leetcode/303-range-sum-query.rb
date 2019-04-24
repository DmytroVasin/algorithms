class NumArray
  def initialize(nums)
    @nums = nums

    create_array_of_sum
  end

  def sum_range(i, j)
    @array_of_sum[j] - @array_of_sum[i - 1]
  end

  private

  def create_array_of_sum
    @array_of_sum = Hash.new(0)

    @nums.each_with_index do |n, index|
      if index == 0
        @array_of_sum[index] = n
      else
        @array_of_sum[index] = n + @array_of_sum[index - 1]
      end
    end
  end
end

obj = NumArray.new([-2,0,3,-5,2,-1])

p obj.sum_range(0, 2)
p obj.sum_range(2, 5)
p obj.sum_range(0, 5)
p obj.sum_range(0, 5)
