def words
  words = File.open("word_list.txt").readlines.map do |line|
    line.match(/^\w+/)[0]
  end
end

def is_subword(subword, word)
  subword = String.new(subword).downcase
  word.downcase!

  if subword.length > word.length
    return false
  end

  word_chars = word.chars
  subword.each_char do |input_char|
    if (i = word_chars.find_index(input_char))
      word_chars.delete_at i
    else
      return false
    end
  end

  return true
end

def anagram_words(input)
  input_sorted_letters = input.chars.sort.join("")
  ret = []
  # go through wordlist
  # for each word, create a hash word_hash of {sorted_letters => [word1, word2, ...]}
  word_hash = Hash.new { |hash, key| hash[key] = [] }
  words().each do |word|
    word.downcase!
    letters = word.chars.sort.join('')
    word_hash[letters] << word
  end

  # go through each word of word_hash
  word_hash.each do |sorted_letters, words|
  # if the known word is a subword of the input
    if is_subword(sorted_letters, input_sorted_letters)
    # add the word
      ret += words
    end
  end

  return ret
end

if __FILE__ == $0
end
    