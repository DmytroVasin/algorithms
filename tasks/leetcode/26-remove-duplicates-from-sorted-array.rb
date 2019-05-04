# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  uniq_hash = {}

  (nums.size - 1).downto(0) do |index|
    num = nums[index]

    if uniq_hash.key?(num)
      nums.delete_at(index)
      next
    end

    uniq_hash[num] = nil
  end

  nums.size
end

ex1 = [0,0,1,1,1,2,2,3,3,4]
p remove_duplicates(ex1) == 5
p ex1 == [0,1,2,3,4]

ex2 = [1,1,2]
p remove_duplicates(ex2) == 2
p ex2 == [1,2]
