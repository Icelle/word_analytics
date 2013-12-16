# Number of each word
# Number of each letter
# Number of each symbol (any non-letter and non-digit character, excluding white space)
# Top three most common words
# Top three most common letters

class WordAnalytics

  attr_reader :string

  def initialize(string)
    @words  = string.downcase.scan(/[a-zA-Z]+/)
    @letters = string.downcase.scan(/\w/)
    @symbols = string.downcase.gsub(/\s+/,"").scan(/\W/)
  end

  def word_frequency
    word_count = {}
    @words.each do |word|
      word_count[word] ||= 0
      word_count[word] += 1
    end
    return word_count
  end

  def letter_frequency
    letter_count = {}
    @letters.each do |letter|
      letter_count[letter] ||= 0
      letter_count[letter] += 1
    end
    return letter_count
  end

  def symbol_frequency
    symbol_count = {}
    @symbols.each do |symbol|
      symbol_count[symbol] ||= 0
      symbol_count[symbol] += 1
    end
    return symbol_count
  end

  def three_most_common_words
    word_frequency.sort_by{ |x,y| y <=> x }[0..2]
  end

  def three_most_common_letters
    letter_frequency.sort[0..2]
  end

end
