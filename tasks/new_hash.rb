require 'test/unit'
require 'benchmark'

# For Ruby 2.3
#       user     system      total        real
# Ruby Hash  0.030000   0.000000   0.030000 (  0.033555)
# My Hash  0.360000   0.000000   0.360000 (  0.367558)

# For Ruby 2.4
#       user     system      total        real
# Ruby Hash  0.020000   0.000000   0.020000 (  0.024075)
# My Hash  0.370000   0.000000   0.370000 (  0.373361)

# Test cases:
class TestMyHash < Test::Unit::TestCase

  def setup
    @hash = MyHash.new
    @hash.instance_variable_set(:@matrix, [
      [['a', '1'], ['d', '4'], ['g', '7']],
      [['b', '2'], ['e', '5'], ['h', '8']],
      [['c', '3'], ['f', '6'], ['i', '9']],
    ])
    @hash.instance_variable_set(:@total_items, 9)
    @hash.instance_variable_set(:@columns, 3)
  end

  def test_set_update_internal_array
    result_matrix = [
      ['a', '1'], ['d', '4'], ['g', '7'],
      ['b', '2'], ['e', '5'], ['h', '8'],
      ['c', '3'], ['f', '6'], ['i', '9'],
      ['j', '10']
    ]

    @hash['j'] = '10'
    assert_equal( @hash.instance_variable_get(:@matrix).flatten(1) - result_matrix, [])
  end

  def test_set_return_correct_value
    assert_equal( @hash['k_3'] = 'v_3', 'v_3')
  end

  def test_set_overwrites_value
    a = 'a'; def a.hash; 0; end

    assert_equal( @hash[a], '1')
    @hash[a] = '2'
    assert_equal( @hash[a], '2')
  end

  def test_get_return_correct_value
    a = 'a'; def a.hash; 0; end
    b = 'e'; def b.hash; 1; end

    assert_equal( @hash[a], '1')
    assert_equal( @hash[b], '5')
  end

  def test_get_of_null_key
    assert_nil( @hash['non_exist_key'] )
  end

  def test_set_do_not_change_columns_counts
    assert_equal( @hash.instance_variable_get(:@matrix).size, 3)
    assert_equal( @hash.instance_variable_get(:@columns), 3)
    @hash['j'] = '10'
    assert_equal( @hash.instance_variable_get(:@matrix).size, 3)
    assert_equal( @hash.instance_variable_get(:@columns), 3)
  end

  def test_set_change_columns_counts_call_rehash
    old_verbose, $VERBOSE = $VERBOSE, nil
    MyHash.const_set('DENSITY', 3)
    $VERBOSE = old_verbose

    assert_equal( @hash.instance_variable_get(:@matrix).size, 3)
    assert_equal( @hash.instance_variable_get(:@columns), 3)
    @hash['j'] = '10'
    assert_equal( @hash.instance_variable_get(:@matrix).size, 6)
    assert_equal( @hash.instance_variable_get(:@columns), 6)

    old_verbose, $VERBOSE = $VERBOSE, nil
    MyHash.const_set('DENSITY', 5)
    $VERBOSE = old_verbose
  end

  def test_set_change_items_counts
    @hash['j'] = '10'
    assert_equal( @hash.instance_variable_get(:@matrix).flatten(1).size, 10)
  end

end


class MyHash
  DENSITY = 5

  def initialize
    @total_items = 0
    @columns = 16

    @matrix = Array.new(@columns) { [] }
  end

  def []=(key, value)
    object = find_object(key)

    if object
      object[1] = value
    else

      if @total_items >= @columns * DENSITY
        rehash
      end

      @total_items += 1
      find_column_for(key).push([key, value])
    end

    value
  end

  def [](key)
    object = find_object(key)

    if object
      object.last
    else
      nil
    end
  end

  private

  def find_object(key)
    find_column_for(key).find do |pair|
      pair.first == key
    end
  end

  def find_column_for(key)
    @matrix[column_index(key)]
  end

  def column_index(key)
    key.hash % @columns
  end

  def rehash
    @columns = @columns * 2

    @new_matrix = Array.new(@columns) { [] }
    @matrix.flatten(1).each do |pair|
      @new_matrix[ column_index(pair[0]) ].push(pair)
    end

    @matrix = @new_matrix
  end
end

# Benchmark:
n = 100_000
Benchmark.bm do |x|
  x.report 'Ruby Hash' do
    _hash = Hash.new

    n.times do |i|
      _hash[i] = rand
      _hash[i]
    end
  end

  x.report 'My Hash' do
    _hash = MyHash.new

    n.times do |i|
      _hash[i] = rand
      _hash[i]
    end

    # puts '>>>>>>>>>>>>>>>>>>>>'
    # p _hash.instance_variable_get(:@matrix).map{ |column| column.size }
    # puts '>>>>>>>>>>>>>>>>>>>>'
  end
end
