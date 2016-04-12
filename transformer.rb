class Transformer
  def self.reverse
    puts "Please enter a sentence:"
    input = gets.chomp
    puts input.reverse
  end

  def self.downcase
    puts "Please enter a sentence:"
    input = gets.chomp
    puts input.downcase
  end

  def self.uppercase
    puts "Please enter a sentence:"
    input = gets.chomp
    puts input.upcase
  end
end
