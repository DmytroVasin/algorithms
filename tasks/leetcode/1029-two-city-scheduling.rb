# then we sort by cost[i][0]-cost[i][1] which means the largest EXTRA cost if change the destination from A to B,
# and after sorting, the last array in costs[][] would be the largest EXTRA cost if we change the destination from B to A

def two_city_sched_cost(costs)
  n_interviews = costs.size / 2

  sorted_costs = costs.sort_by { |pair| pair[0] - pair[1] }

  total_minimum_cost = 0

  sorted_costs.each_with_index do |pair, index|
    if n_interviews >= index + 1
      total_minimum_cost += pair[0]
    else
      total_minimum_cost += pair[1]
    end
  end

  total_minimum_cost
end


p two_city_sched_cost( [ [10,20], [30,200], [400,50], [30,20] ] ) == 110
