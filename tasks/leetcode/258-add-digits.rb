# @param {Integer} num
# @return {Integer}
def add_digits(num)
  num_string = num.to_s

  while num_string.size >= 2 do
    local_sum = 0

    num_string.each_char do |char|
      local_sum += char.to_i
    end

    num_string = local_sum.to_s
  end

  num_string.to_i
end


p add_digits(38) == '2'
