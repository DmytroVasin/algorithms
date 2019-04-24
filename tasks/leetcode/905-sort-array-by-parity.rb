# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity(a)
  resulted_array = []

  a.each do |num|
    if num % 2 == 0
      resulted_array.unshift(num)
      next
    end

    resulted_array.push(num)
  end

  resulted_array
end

p sort_array_by_parity([3,1,2,4])  == [4,2,3,1]
