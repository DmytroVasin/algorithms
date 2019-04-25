# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)

  current_max, *rest = nums
  global_max = current_max

  rest.each do |current_value|
    prev_values = current_value + current_max

    if current_value > prev_values
      current_max = current_value
    else
      current_max = prev_values
    end

    if current_max > global_max
      global_max = current_max
    end
  end

  global_max
end

p max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) == 6








# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)

  max_so_far, *rest = nums
  max_ending_sum = max_so_far

  rest.each do |num|
    max_so_far = [num + max_so_far, num].max
    max_ending_sum = [max_ending_sum, max_so_far].max
  end

  max_ending_sum
end

p max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) == 6
