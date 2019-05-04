# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  intersection_table = Hash.new { 0 }
  nums1.each do |num|
    intersection_table[num] += 1
  end

  interection_values = []
  nums2.each do |num|
    if intersection_table[num] > 0
      intersection_table[num] -= 1

      interection_values.push(num)
    end
  end

  interection_values
end

p intersection([1,2,2,1], [2,2])# == [2, 2]
p intersection([4,9,5], [9,4,9,8,4])# == [9,4]
