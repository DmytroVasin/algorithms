# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
  chars = s.chars
  whole_length = chars.size

  whole_length.times do |length|
    next if length.zero?

    start_substring = chars[0...length]
    local_length = length

    while local_length < whole_length do

      if chars[local_length...(local_length+local_length)] == start_substring
      end

      local_length += local_length
    end
  end
end

p repeated_substring_pattern('abab') == true
# p repeated_substring_pattern('aba') == false
# p repeated_substring_pattern('abcabcabcabc') == true
