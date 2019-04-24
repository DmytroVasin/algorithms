# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  position = nums.size

  nums.each_with_index do |num, index|
    next if num < target

    position = index
    break
  end

  position
end


p search_insert([1,3,5,6], 5) == 2
p search_insert([1,3,5,6], 2) == 1
p search_insert([1,3,5,6], 7) == 4
p search_insert([1,3,5,6], 0) == 0
