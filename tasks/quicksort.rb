def quicksort(array)
  return [] if array.empty?

  first = array[0]

  part_before(first, array) + [first] + part_after(first, array)
end


def part_before(element, array)
  selected_items = array.select{ |item| item < element }

  quicksort(selected_items)
end

def part_after(element, array)
  selected_items = array.select{ |item| item > element }

  quicksort(selected_items)
end


p quicksort([3,3,7,7,2,1,8,8,12])
