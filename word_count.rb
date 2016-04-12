class WordCount
  def self.count
    puts "Please enter a sentence:"
    input = gets.chomp
    puts "This includes #{input.split(' ').count} words."
  end
end
