ex1 = [6,2,5,4,5,1,6]
#      #     #
#      # # # #
#      # ### #
#      # ### #
#      ##### #
#      #######


ex2 = [6,2,5,4,5,1,6]
#      #     #
#      # # # #
#      # ### #
#      # ### #
#      ##### #
#      #######



ex3 = [1,3,5,3,0,2,6,6,1,0,3,6]
#            ##   #
#        #   ##   #
#        #   ##   #
#       ###  ##  ##
#       ### ###  ##
#      #### #### ##



ex4 = [1,3,5,3,2,2,3,3,1,0,3,6]
#      |           #|
#      |  #        #|
#      |  #        #|
#      | ###  ##  ##|
#      | #######  ##|
#      |######### ##|


ex4 = [5,3,5,3,2,2,3,3,1,0,3,6]
#      |           #|
#      |# #        #|
#      |# #        #|
#      |####  ##  ##|
#      |########  ##|
#      |######### ##|

ex5 = [1,3]


resulted_array = []
max = 0

ex5.each_with_index do |num, i|
  # p "iteration START: ==================#{num}============"
  # p "BEFORE: #{resulted_array}"

  num.times do |n_time|
    resulted_array[n_time] ||= 0
    resulted_array[n_time] += 1
  end

  # p "APPLIED: #{resulted_array}"

  resulted_array.each_with_index do |el, index|
    sub_rect_sum = el * (index + 1)
    max = sub_rect_sum if sub_rect_sum > max

    if index > (num - 1)
      # max = sub_rect_sum if sub_rect_sum > max
      resulted_array[index] = 0
    end
  end

  p "AFTER: #{resulted_array}"
end

p max
