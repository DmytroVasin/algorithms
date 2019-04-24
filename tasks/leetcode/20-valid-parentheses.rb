require 'pry'

# @param {String} s
# @return {Boolean}
def is_valid(s)
  char_stack = [];

  char_eqvivalents = {
      "(" => ")",
      "{" => "}",
      "[" => "]",
  }

  char_open = char_eqvivalents.keys
  char_close = char_eqvivalents.values

  s.each_char do |char|
    if char_open.include?(char)
      char_stack.push( char_eqvivalents[char] )
    end

    if char_close.include?(char)
      last_in_stack = char_stack.pop

      if last_in_stack != char
        return false
      end
    end
  end

  char_stack.size.zero?
end






ex0 = "()"
# Output: true


ex1 = "()[]{}"
# Output: true

ex2 = "(]"
# Output: false

ex3 = "([)]"
# Output: false

ex4 = "{[]}"
# Output: true

ex5 = "}{"
# Output: true


p is_valid(ex4)
