require 'ruby-dictionary'

class WordChain
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_chain(start_word, end_word)
    temp_word = start_word

    start_word.chars.each_with_index do |_char, i|
      puts temp_word
      temp_word[i] = end_word[i]
    end

    puts end_word
  end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")
chain = WordChain.new(dictionary)

chain.find_chain("cat", "dog")
