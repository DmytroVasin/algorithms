# https://leetcode.com/problems/132-pattern/?tab=Description
# https://discuss.leetcode.com/topic/67881/single-pass-c-o-n-space-and-time-solution-8-lines-with-detailed-explanation

# def check_pattern(array)
#   index = array.size

#   a = nil
#   b = nil
#   c = nil
#   c_array = []

#   while index != 0
#     index = index-1
#     current_num = array[index]

#     if b.nil? && c_array.any?
#       if current_num > c_array.min
#         b = current_num
#         c = c_array.find_all { |i|  i < b }.max
#         c_array = [b, c]
#         next
#       end
#     end


#     if b && c
#       if current_num < c
#         a = current_num
#       elsif current_num >= b
#         b = current_num
#         c = c_array.find_all { |i|  i < b }.max
#       end
#     end

#     if a && b && c
#       p "True: #{a}...#{b}...#{c}"
#       return true
#     end

#     c_array << current_num
#   end

#   p 'False'
#   return false
# end

# # check_pattern([ 9, 11, 8, 9, 10, 7, 9 ])
# # check_pattern([ 1, 2, 3, 4 ])
# # check_pattern([ 3, 1, 4, 2 ])
# # check_pattern([ -1, 3, 2, 0 ])
# # check_pattern([ -2, 1, 2, -2, 1, 2])
# # check_pattern([ 2, 4, 3, 1])
# # check_pattern([ 10, 12, 6, 8, 3, 11])
# check_pattern([0,2,1,2,0])


def find132pattern(array)
  return false if array.length <= 2

  new_min = nil
  a = array[0]
  b = nil

  array[1..-1].each do |num|
    if b.nil?
      if num > a
        b = num
      else
        a = num
      end

      next
    end

    if num > a
      if num < b
        p 'TRUE'
        return true
      else
        a = new_min if !new_min.nil?
        b = num
      end
    else
      new_min = num if (new_min.nil? || new_min > num)
    end
  end

  p 'FALSE'
  return false
end


# find132pattern([ 9, 10, 8, 9, 11, 7, 9 ])
# find132pattern([ 9, 11, 8, 9, 10, 7, 9 ])
# find132pattern([ 1, 2, 3, 4 ])
# find132pattern([ 3, 1, 4, 2 ])
# find132pattern([ -1, 3, 2, 0 ])
# find132pattern([ -2, 1, 2, -2, 1, 2])
# find132pattern([ 2, 4, 3, 1])
# find132pattern([ 10, 12, 6, 8, 3, 11])
# find132pattern([0,2,1,2,0])
find132pattern([8,10,4,6,5])
