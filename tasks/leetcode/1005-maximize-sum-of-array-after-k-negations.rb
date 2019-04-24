# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def largest_sum_after_k_negations(a, k)
  a.sort!

  steps = k
  current_step = 0
  minimal = 0

  while steps != 0 && a[current_step] < 0 do
    a[current_step] = -a[current_step]

    current_step += 1
    steps -= 1
  end


  if (steps % 2) != 0
    minimal = [a[current_step - 1], a[current_step]].compact.min
  end


  a.sum - 2*minimal
end






# largest_sum_after_k_negations([2,3,4], 1) == 5
# # Explanation: Choose indices (1,) and A becomes [4,-2,3].



# largest_sum_after_k_negations([-1,0,2,3], 3) == 6
# # # Explanation: Choose indices (1, 2, 2) and A becomes [3,1,0,2].



# largest_sum_after_k_negations([-4,-3,-1,2,5], 2) == 13
# # # Explanation: Choose indices (1, 4) and A becomes [2,3,-1,5,4].


p largest_sum_after_k_negations([-8,-5,-3,-5,-2, 3], 6) == 22
# # Explanation: Choose indices (1, 4) and A becomes [2,3,-1,5,4].
