# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}

def find_bottom_left_value(root)
  lvl_values = []
  lvl_values[0] = root.val

  find_value_for_lvl(root, 1, lvl_values)

  lvl_values.last
end

def find_value_for_lvl(node, lvl, lvl_values)
  [node.left, node.right].each do |node|
    next if node.nil?

    if lvl_values[lvl].nil?
      lvl_values[lvl] = node.val
    end

    find_value_for_lvl(node, lvl+1, lvl_values)
  end
end



# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

root = TreeNode.new(1)
lvl_1_left =  TreeNode.new(2)
lvl_1_right = TreeNode.new(3)
lvl_2_left  = TreeNode.new(5)
lvl_2_right = TreeNode.new(6)


root.left = lvl_1_left
root.right = lvl_1_right

lvl_1_left.left = TreeNode.new(4)

lvl_1_right.left =  lvl_2_left
lvl_1_right.right =  lvl_2_right

lvl_2_left.left  = TreeNode.new(7)

# root = TreeNode.new(0)
p find_bottom_left_value(root)
