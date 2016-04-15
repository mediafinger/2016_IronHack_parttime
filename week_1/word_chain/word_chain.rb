require 'ruby-dictionary'

class WordChain
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_chain(start_word, end_word)
    chain_word = start_word
    puts chain_word

    while chain_word != end_word
      end_word.chars.each_with_index do |char, i|
        temp_word = chain_word.dup # we have to use a dup / Duplicate of the String
        temp_word[i] = char

        if find_word(temp_word)
          puts temp_word if temp_word != chain_word
          chain_word = temp_word
        end
      end
    end
  end

  def find_word(word)
    @dictionary.exists?(word)
  end
end

# instantiate and execute the code:

dictionary = Dictionary.from_file("/usr/share/dict/words")
chain = WordChain.new(dictionary)

chain.find_chain("cat", "dog")
chain.find_chain("code", "ruby")
