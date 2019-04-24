# @param {String} s
# @return {String}
def frequency_sort(s)
  h = Hash.new(0);

  s.each_char do |char|
    h[char] += 1
  end

  res_ar = h.map do |key, value|
    key*value
  end

  res_ar.sort_by{ |x| -x.size }.join()
end



ex0 = "treeaaaAAbb"   # => "eert"
ex1 = "Aabb"   # => "bbAa"
ex2 = "cccaaa" # => "cccaaa"

p frequency_sort(ex2)
