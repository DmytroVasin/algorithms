# require 'pry'

class WordFinder
  def initialize(word)
    @word = word.split('')

    @matrix = [
      ['S','L','A'],
      ['F','J','S'],
      ['H','A','K']
    ]
    @matrix_width  = @matrix[0].size
    @matrix_height = @matrix.size
  end

  def call
    @matrix.each_with_index do |row, row_index|
      row.each_with_index do |_, col_index|
        recursive_finder(row_index, col_index, 0, [])
      end
    end
  end

  private

  def recursive_finder(row,col, letter_index, used_cells)
    current_letter = @word[letter_index]
    next_letter = @word[letter_index + 1]

    return if current_letter != @matrix[row][col]
    if next_letter.nil?
      p 'WORD FOUND'
      return
    end

    # p "current_letter: #{current_letter} | [row][col]: #{[row, col]}"

    up    = [row-1, col]
    down  = [row+1, col]
    left  = [row,   col-1]
    right = [row,   col+1]

    [up, down, left, right].each do |row, col|
      next if behind_zone?(row, col)
      next if already_in_use?(row, col, used_cells)

      # p "AVAILABLE: row: #{row}; col: #{col};"

      next_index = letter_index + 1
      updated_used_cells = used_cells + [[row, col]]

      recursive_finder(row, col, next_index, updated_used_cells)
    end
  end

  def behind_zone?(i,j)
    i < 0 || j < 0 || i == @matrix_width || j == @matrix_height
  end

  def already_in_use?(i,j, used_cells)
    used_cells.any? { |used_i, used_j| used_i == i && used_j == j }
  end
end

WordFinder.new('AL').call
