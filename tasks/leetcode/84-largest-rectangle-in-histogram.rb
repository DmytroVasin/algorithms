# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  first_column, *rest_columns = heights

  global_max = 0
  combined_array = Array.new(first_column.to_i, 1)

  p rest_columns

  rest_columns.each do |col|
    # current_column_values = Array.new(2147483647, 1)











    # Увеличиваем combined array
    col.times do |i|
      combined_array[i] ||= 0
      combined_array[i] += 1
    end
    p "....#{col}."

    # Тут мы зануляем значения которые выше текущей высоты ( так как rectangle закончен)
    combined_array.each_with_index do |cell, index|
      current_col_height = index+1

      if current_col_height > col

        local_rect_square = cell * current_col_height
        if local_rect_square > global_max
          global_max = local_rect_square
        end

        combined_array[index] = 0
      end
    end
  end

  combined_array.each_with_index do |combined_width, index|
    rectangle_height = index + 1

    local_rect_square = combined_width * rectangle_height
    if local_rect_square > global_max
      global_max = local_rect_square
    end
  end

  global_max
end

# ex1 = [0,0,0,0,0,0,0,0,2 147 483 647]
ex1 = [0,0,0,0,0,0,0,0,2147]

p largest_rectangle_area(ex1)
