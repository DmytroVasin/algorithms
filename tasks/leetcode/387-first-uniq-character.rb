# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  _hash = Hash.new(0)
  chars = s.chars

  chars.each do |char|
    _hash[char] += 1
  end

  chars.each.with_index do |char, index|
    if _hash[char] == 1
        return index
    end
  end

  -1
end





ex1 = "leetcode"

ex2 = "loveleetcode"


p first_uniq_char(ex1)
# p first_uniq_char(ex2)
