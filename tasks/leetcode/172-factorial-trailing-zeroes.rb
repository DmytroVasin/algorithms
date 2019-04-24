# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  trailing_zeroes_count = 0

  devider = 5

  while (n / devider) > 0 do
      trailing_zeroes_count += (n / devider)

      devider *= 5
  end

  trailing_zeroes_count
end


p trailing_zeroes(0) == 0
p trailing_zeroes(20) == 4
p trailing_zeroes(100) == 24
