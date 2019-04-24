require 'pry'

class MyHashMap
  def initialize()
    @elements = 0
    @density = 11
    @my_hash_array = Array.new(@density) { [] }
  end

  def put(key, value)
    rehash! if need_rehash?

    bucket = find_bucket(key)

    detected_cell =  @my_hash_array[bucket].detect { |cell| cell[0] == key }

    if detected_cell
      detected_cell[1] = value
    else
      @my_hash_array[bucket].push([key, value])
      @elements += 1
    end
    nil
  end

  def get(key)
    bucket = find_bucket(key)
    @my_hash_array[bucket].each do |cell|
      return cell[1] if key == cell[0]
    end

    -1
  end

  def remove(key)
    bucket = find_bucket(key)

    index_cell = nil
    @my_hash_array[bucket].each_with_index do |cell, index|
      index_cell = index if cell[0] == key
    end

    if index_cell
      @my_hash_array[bucket][index_cell] = []
      @elements -= 1
    end

    nil
  end

  private

  def find_bucket(key)
    key % @density
  end

  def need_rehash?
    (@elements / @density) > @density
  end

  def rehash!
    @density = @density * 3

    _new_hash = Array.new(@density) { [] }

    @my_hash_array.each do |row|
      row.each do |cell|
        next if cell[0].nil?

        bucket = find_bucket(cell[0])
        _new_hash[bucket].push(cell)
      end
    end

    @my_hash_array = _new_hash
  end
end

hashMap = MyHashMap.new;
hashMap.put(1, 1);
hashMap.put(2, 2);
hashMap.put(3, 2);
hashMap.put(4, 2);
hashMap.put(5, 2);
hashMap.put(6, 2);
hashMap.put(7, 2);
hashMap.put(8, 2);
hashMap.put(9, 2);
hashMap.put(19, 2);
hashMap.put(29, 2);
hashMap.put(39, 2);
raise unless hashMap.get(1) == 1
raise unless hashMap.get(3);                  # returns -1 (not found)
hashMap.put(2, 1);                            # update the existing value
raise unless hashMap.get(2) == 1;             # returns 1
hashMap.remove(2);                            # remove the mapping for 2
raise unless hashMap.get(2) == -1;            # returns -1 (not found)
