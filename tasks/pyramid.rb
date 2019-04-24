# https://telegra.ph/UniLecs-135-1-Piramida-10-30

require 'pry'

class PyramidsCounter
  def self.call(n)
    self.new(n).call
  end

  def initialize(all_blocks)
    @all_blocks = all_blocks
    @result = 0
  end

  def call
    1.upto(@all_blocks) do |step|
      @result += build_pyramid(@all_blocks, step)
    end

    p "With #{@all_blocks} block(s) you can create #{@result} pyramid(s)"
    @result
  end

  private

  def build_pyramid(blocks, basis)
    # Если кол-во блоков совпадает с основанием - то выводим
    return 1 if blocks == basis


    # Кол-во блоков, которые остались
    blocks_left = blocks - basis
    # Следующее возможное основание
    next_basis = basis - 1
    # Если след основание 0 - то выходим
    return 0 if next_basis.zero?


    # Если следующее основание больше чем кол-во блоков, которые остались,
    # То берем оставшиеся блоки за основание:
    next_basis = blocks_left if next_basis > blocks_left

    mediate_res = 0
    1.upto(next_basis) do |step|
      mediate_res += build_pyramid(blocks_left, step)
    end
    mediate_res
  end
end

# PyramidsCounter.call(1)
# PyramidsCounter.call(2)
# PyramidsCounter.call(3)
# PyramidsCounter.call(5)
PyramidsCounter.call(50)
