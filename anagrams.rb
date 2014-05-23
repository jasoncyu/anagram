def words
  words = File.open("word_list.txt").readlines.map do |line|
    line.match(/^\w+/)[0]
  end
end

def is_subword(input, word)
  input.downcase!
  word.downcase!

  if input.length > word.length
    return false
  end

  word_chars = word.chars
  input.each_char do |input_char|
    if (i = word_chars.find_index(input_char))
      word_chars.delete_at i
    else
      return false
    end
  end

  return true
end

if __FILE__ == $0
  # go through wordlist
  # for each word, create a hash word_hash of {sorted_letters => word}
  known_words = Hash[words().map{|word| [word.downcase.sort, word]}]
  # go through each word of word_hash
  known_words.each do |word|
  # if the input is a subword of it
    if is_subword(input, word)
    # add the word
      words << word
    end
  end
end
    