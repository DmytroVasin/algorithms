NOT CORRECT SOLUTION!.

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
    new_plots = n

    flowerbed.size.times do |position|
        break if new_plots == 0

        next if flowerbed[position - 1] == 1 && position > 0
        next if flowerbed[position + 1] == 1 && position < flowerbed.size
        next if flowerbed[position] == 1

        new_plots -= 1
        flowerbed[position] = 1
    end

    new_plots == 0
end
