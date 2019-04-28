def buddy_strings(a, b)
  a_size = a.size
  return false if a_size != b.size

  diff_count = 0
  diff_chars = Hash.new { 0 }

  a_size.times do |index|
    if a[index] != b[index]
      diff_count += 1
      diff_chars[a[index]] += 1
      diff_chars[b[index]] -= 1
    end
  end

  if diff_count == 2 && diff_chars.values.all? { |x| x == 0 }
    return true
  end

  if diff_count == 0 && a_size != a.chars.uniq.size
    return true
  end

  false
end

p buddy_strings('ab', 'ba') == true
p buddy_strings('ab', 'ab') == false
p buddy_strings('aa', 'aa') == true
p buddy_strings('aaaaaaabc', 'aaaaaaacb') == true
p buddy_strings('abcab', 'abcba') == true
p buddy_strings('abcaa', 'abcbb') == false
