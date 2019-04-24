# @param {String} a
# @param {String} b
# @return {String[]}
def uncommon_from_sentences(a, b)
  hash_with_all = {}
  hash_with_uniq = {}

  mutator = ''
  a.each_char do |char|
    if char != ' '
      mutator << char
      next
    end

    apply_key(mutator, hash_with_all, hash_with_uniq)
    mutator = ''
  end

  apply_key(mutator, hash_with_all, hash_with_uniq)

  mutator = ''
  b.each_char do |char|
    if char != ' '
      mutator << char
      next
    end

    apply_key(mutator, hash_with_all, hash_with_uniq)
    mutator = ''
  end

  apply_key(mutator, hash_with_all, hash_with_uniq)

  hash_with_uniq.keys
end

def apply_key(mutator, hash_with_all, hash_with_uniq)
  if hash_with_all.key?(mutator)
    hash_with_uniq.delete(mutator)
  else
    hash_with_all[mutator] = nil
    hash_with_uniq[mutator] = nil
  end
end



p uncommon_from_sentences("this apple is sweet", "this apple is sour")
# Output: ["sweet","sour"]


p uncommon_from_sentences("apple apple", "banana")
# Output: ["banana"]
