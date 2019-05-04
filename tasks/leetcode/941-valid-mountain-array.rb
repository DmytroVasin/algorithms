# @param {Integer[]} a
# @return {Boolean}
def valid_mountain_array(a)
  claimbing_up = false
  claimbing_down = false

  claimb_direction = 'up'
  prev = nil

  a.each_with_index do |current, index|
    prev = a[index - 1]

    next if index.zero?

    num_substraction = prev - current

    if claimb_direction == 'up' && num_substraction.negative?
      claimbing_up = true
      next
    end

    if claimb_direction == 'up' && num_substraction.positive?
      claimbing_down = true
      claimb_direction = 'down'
      next
    end

    if claimb_direction == 'down' && num_substraction.positive?
      next
    end

    return false
  end

  claimbing_up && claimbing_down
end

# p valid_mountain_array([3,5,5,8,2]) # => false
# p valid_mountain_array([0,1,2,1,2]) # => false
p valid_mountain_array([0,1,2,3,4,5,6,7,8,9]) # => false
p valid_mountain_array([9,8,7,6,5,4,3,2,1,0]) # => false
p valid_mountain_array([0,3,2,1]) # => true
p valid_mountain_array([0,1,2,1,2]) # => false
p valid_mountain_array([3,5,5]) # => false
