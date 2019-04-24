# Solution: https://www.youtube.com/watch?v=yCQN096CwWM
# Get Subarray maximum. Kadane's Algorithm

require 'pry'

class CalculateMaxSubInLine
  LineResult = Struct.new(:sum, :start, :end)

  def initialize(array)
    first, *rest = *array

    @array        = rest
    @max_current  = first
    @max_global   = first

    @start_global = 0
    @end_global = 0
  end

  def call
    local_start = 0

    @array.each_with_index do |element, index|
      if element >= element + @max_current
        local_start = index + 1
        local_max = element
      else
        local_max = element + @max_current
      end

      @max_current = local_max

      if local_max > @max_global
        @start_global = local_start
        @end_global   = index + 1
        @max_global   = local_max
      end
    end

    prettified_result
  end

  private

  def prettified_result
    LineResult.new(@max_global, @start_global, @end_global)
  end
end

class CalculateMaxSubInMatrix
  MatrixResult = Struct.new(:sum, :maxLeft, :maxRight, :maxUp, :maxDown)

  def initialize(matrix)
    @matrix        = matrix
    @matrix_width  = @matrix[0].size
    @matrix_height = @matrix.size

    @left_pointer = 0
    @rigth_pointer = 0

    @current_sum = kaden_result.sum

    @left  = @left_pointer
    @rigth = @rigth_pointer
    @up    = kaden_result.start
    @down  = kaden_result.end
  end

  def call
    0.upto(@matrix_width - 1) do |left_pointer|
      temp_array = Array.new(@matrix_height) { 0 }

      left_pointer.upto(@matrix_width - 1) do |rigth_pointer|
        temp_array = concat_array(temp_array, matrix_column(rigth_pointer))
        kaden_result = CalculateMaxSubInLine.new(temp_array).call

        current_sum = kaden_result.sum

        next if @max_sum && current_sum <= @max_sum

        @max_sum   = current_sum

        @max_left  = left_pointer
        @max_right = rigth_pointer

        @max_up    = kaden_result.start
        @max_down  = kaden_result.end
      end
    end

    prettified_result
  end

  private

  def prettified_result
    MatrixResult.new(@max_sum, @max_left, @max_right, @max_up, @max_down)
  end

  def matrix_column(n)
    @matrix.map { |row| row[n] }
  end

  def concat_array(array_1, array_2)
    concated_array = []

    0.upto(array_1.size - 1) do |index|
      concated_array.push( array_1[index] + array_2[index] )
    end

    concated_array
  end
end



# Tests:
require 'test/unit'
class LineTest < Test::Unit::TestCase
  def max_in_line(array)
    CalculateMaxSubInLine.new(array).call
  end

  def test_1
    array = [1, -5, 3, 2, -1, -7, -2, 1]
    result = max_in_line(array)

    assert( result.start.eql?(2) )
    assert( result.end.eql?(3)   )
    assert( result.sum.eql?(5)   )
  end

  def test_2
    array = [2, -5, 3, -2, 1, -7, 2, 1]
    result = max_in_line(array)

    assert( result.start.eql?(2) )
    assert( result.end.eql?(2)   )
    assert( result.sum.eql?(3)   )
  end

  def test_3
    array = [-1, 5, 3, 2, -1, 7, 2, 1]
    result = max_in_line(array)

    assert( result.start.eql?(1) )
    assert( result.end.eql?(7)   )
    assert( result.sum.eql?(19)   )
  end

  def test_4
    array = [-1, 3, -2, 5, -6, 1]
    result = max_in_line(array)

    assert( result.start.eql?(1) )
    assert( result.end.eql?(3)   )
    assert( result.sum.eql?(6)   )
  end

  def test_5
    array = [2, 0, 2, -3]
    result = max_in_line(array)

    assert( result.start.eql?(0) )
    assert( result.end.eql?(2)   )
    assert( result.sum.eql?(4)   )
  end
end

class MatrixTest < Test::Unit::TestCase
  def max_in_matrix(matrix)
    CalculateMaxSubInMatrix.new(matrix).call
  end

  def test_1
    matrix = [ # => SUM: 18
      [ 2,  1,  -3, -4,  5], # => [ _,  _,   _,  _, _],
      [ 0,  6,   3,  4,  1], # => [ _,  6,   3,  4, _],
      [ 2, -2,  -1,  4, -5], # => [ _, -2,  -1,  4, _],
      [-3,  3,   1,  0,  3], # => [ _,  3,   1,  0, _]
    ]

    result = max_in_matrix(matrix)
    assert( result.sum.eql?(18)     )

    assert( result.maxLeft.eql?(1)  )
    assert( result.maxRight.eql?(3) )
    assert( result.maxUp.eql?(1)    )
    assert( result.maxDown.eql?(3)  )
  end
end
