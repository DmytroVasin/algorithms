# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer[]}
def num_moves_stones(a, b, c)
  lowest, middle, biggest = [a,b,c].sort

  diff_right = biggest - middle - 1
  diff_left = middle - lowest - 1


  max = biggest - lowest - 2

  min = 0 if diff_right.zero? && diff_left.zero?
  min = 1 if diff_right.zero? && !diff_left.zero?
  min = 1 if !diff_right.zero? && diff_left.zero?

  if !diff_right.zero? && !diff_left.zero?
    diff_min = [diff_right, diff_left].min - 1

    if diff_min == 0
      min = 1 
    else
      min = 2
    end
  end


  [min, max]
end


p num_moves_stones(1, 2, 5) == [1,2]
p num_moves_stones(4, 3, 2) == [0,0]
p num_moves_stones(7, 4, 1) == [2,4]
p num_moves_stones(3, 5, 1) == [1,2]
