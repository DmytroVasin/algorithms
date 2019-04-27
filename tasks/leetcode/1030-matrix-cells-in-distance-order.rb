# @param {Integer} r
# @param {Integer} c
# @param {Integer} r0
# @param {Integer} c0
# @return {Integer[][]}
def all_cells_dist_order(r, c, r0, c0)
  distance_set = {}
  max_distance = 0

  r.times do |row_index|
    c.times do |col_index|
      distance = (r0 - row_index).abs + (c0 - col_index).abs

      distance_set[distance] ||= []
      distance_set[distance].push([row_index, col_index])

      max_distance = distance if distance > max_distance
    end
  end

  res_distance_array = []

  0.upto(max_distance) do |distance|
    distance_set[distance].each do |cell|
      res_distance_array.push(cell)
    end
  end

  res_distance_array
end



p # all_cells_dist_order(1,2,0,0) == [[0,0],[0,1]]
p # all_cells_dist_order(2,2,0,1) == [[0,1],[0,0],[1,1],[1,0]]
p all_cells_dist_order(2,3,1,2) == [[1,2],[0,2],[1,1],[0,1],[1,0],[0,0]]
