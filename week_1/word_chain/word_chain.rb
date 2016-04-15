require 'ruby-dictionary'

# This defines our own error class - they ALWAYS inherit from StandardError
# When this error is only used be the class below, it is best practice
# to define it in the same file, above the class
#
class ArgumentError < StandardError; end
class NoWordPathFoundError < StandardError; end

class WordChain
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_chain(start_word, end_word)
    # This throws our error with an individual message
    # Try it out by calling: find_chain("cat", "tiger")
    fail ArgumentError, "Both words have to be of the same length" unless start_word.length == end_word.length
    fail ArgumentError, "The second word is not in the dictionary" unless find_word(end_word)

    chain_word = start_word
    puts chain_word

    while chain_word != end_word
      temp_word = chain_word.dup

      end_word.chars.each_with_index do |char, i|
        break if chain_word == end_word # break will exit the iterator

        chain_word = new_word(chain_word, char, i)
      end

      fail NoWordPathFoundError if temp_word == chain_word
    end
  end

  def new_word(word, char, index)
    temp_word = word.dup # we have to use a dup / Duplicate of the String
    temp_word[index] = char

    if find_word(temp_word)
      puts temp_word if temp_word != word
      temp_word
    else
      word
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
