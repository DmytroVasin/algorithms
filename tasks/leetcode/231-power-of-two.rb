# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  return false if n <= 0
  return true if n == 1

  while n > 1 do
    n, rest_n = n.divmod(2)
    return false if rest_n == 1
  end

  true
end


def is_power_of_two(n)
  return false if n <= 0

  bits = n.to_s(2)
  return false if !bits.start_with?('1')

  bits.count('1') == 1
end
