# require 'pry'

def has_alternating_bits(n)
  binary_string = n.to_s(2)
  prev_char = nil

  binary_string.each_char do |char|
    if prev_char.nil?
      prev_char = char
      next
    end

    if prev_char == char
      return false
    end

    prev_char = char
  end

  true
end


ex1 = 5  # true
ex2 = 7  # false
ex3 = 11 # false
ex4 = 10 # true

p has_alternating_bits(ex4)
