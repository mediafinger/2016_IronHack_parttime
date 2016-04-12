class Counter
  def self.count_words
    puts "Please enter a sentence:"
    input = gets.chomp
    puts "This includes #{input.split(' ').count} words."
  end

  def self.count_characters
    puts "Please enter a sentence:"
    input = gets.chomp
    puts "This includes #{input.length} characters."
  end
end
