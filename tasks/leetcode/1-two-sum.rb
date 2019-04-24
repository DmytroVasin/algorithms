# def two_sum(nums, target)
#   max_index = nums.size - 1

#   nums.each_with_index do |first, first_index|
#     next_index = first_index + 1

#     next_index.upto(max_index) do |second_index|
#       second = nums[second_index]

#       if first + second == target
#         return [first_index, second_index]
#       end
#     end
#   end

#   fail 'Wrong input'
# end

# def two_sum(nums, target)
#   sorted_nums = nums.sort

#   last_index = sorted_nums.size - 1
#   first_index = 0

#   smaller = sorted_nums[first_index]
#   bigger = sorted_nums[last_index]

#   while true do
#     if bigger + smaller > target
#       last_index -= 1
#       bigger = sorted_nums[last_index]

#       next
#     end

#     smaller_have_to_be = target - bigger

#     while true do
#       if smaller < smaller_have_to_be
#         first_index += 1
#         smaller = sorted_nums[first_index]

#         next
#       end

#       break
#     end

#     if smaller != smaller_have_to_be
#       last_index -= 1
#       bigger = sorted_nums[last_index]
#       next
#     end

#     break
#   end

#   # Find correct indexes ( because that indexs in sorted array )

#   result = []
#   nums.each_with_index do |number, index|
#     if [smaller, bigger].include?(number)
#       result.push(index)
#     end
#   end

#   result
# end










def two_sum(nums, target)
  sorted_nums = nums.sort

  last_index = sorted_nums.size - 1
  first_index = 0

  while true do
    if sorted_nums[last_index] + sorted_nums[first_index] > target
      last_index -= 1

      next
    end

    smaller_have_to_be = target - sorted_nums[last_index]

    while true do
      if sorted_nums[first_index] < smaller_have_to_be
        first_index += 1

        next
      end

      break
    end

    if sorted_nums[first_index] != smaller_have_to_be
      last_index -= 1
      next
    end

    break
  end

  # Find correct indexes ( because that indexs in sorted array )

  result = []
  nums.each_with_index do |number, index|
    if [sorted_nums[first_index], sorted_nums[last_index]].include?(number)
      result.push(index)
    end
  end

  result
end












# ex2 = [[0, 1, 2,7,11,15], 9]
# ex2 = [[2, 3, 7, 8, 9, 10, 19, 28], 15]
# ex2 = [[-20, -10, -9, -5, -4, -3, -2, -1], -8]
# ex2 = [[3,2,4], 6]
ex2 = [
        [217,231,523,52,547,243,648,509,415,149,689,710,265,187,370,56,977,182,400,329,471,805,955,989,255,766,38,566,79,843,295,229,988,108,781,619,704,542,335,307,359,907,727,959,161,699,123,650,147,459,657,188,304,268,405,685,620,721,351,570,899,60,388,771,24,659,425,440,508,373,32,645,409,272,356,175,533,740,370,152,34,510,745,251,227,494,258,527,817,773,178,194,860,387,627,851,449,736,15,212,529,950,316,28,65,484,968,63,4,643,795,669,203,677,139,636,289,555,430,849,150,493,301,377,240,873,965,441,230,349,447,470],
        718
      ] # => [27,79]

# 359
# 566 + 152

# ex2 = [
#         [217,
#           566,
#           359,
#           152,
#         ],
#         718
#       ] # => [27,79]

p two_sum(*ex2)
