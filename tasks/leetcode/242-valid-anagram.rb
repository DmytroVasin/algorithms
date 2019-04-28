# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false unless s.length == t.length

  original_hash_table = Hash.new { 0 }

  s.each_char do |char|
    original_hash_table[char] += 1
  end

  t.each_char do |char|
    original_hash_table[char] -= 1
  end

  original_hash_table.each do |key, value|
    return false if value != 0
  end

  true
end

p is_anagram("anagram", "nagaram") == true
p is_anagram("rat", "car") == false
