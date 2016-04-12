require_relative "./counter.rb"
require_relative "./transformer.rb"

class Login
  def initialize
  end

  def prompt
    print "please enter your name:"
    name = gets.chomp
    print "please enter your password:"
    password = gets.chomp

    if User.new(FileStorage).valid?(name, password)
    # just comment the line above and uncomment
    # the line below to use a different implementation
    # if User.new.valid?(name, password)
      show_menu
    else
      puts "Try again"
      prompt
    end
  end

  private

  def show_menu
    puts "Please select:"
    puts "A) word count"
    puts "B) letter count"
    puts "C) reverse string"
    puts "D) to lowercase"
    puts "E) to uppercase"

    selection = gets.chomp.downcase

    case selection
    when "a"
      puts Counter.count_words
    when "b"
      puts Counter.count_characters
    when "c"
      puts Transformer.reverse
    when "d"
      puts Transformer.downcase
    when "e"
      puts Transformer.uppercase
    end

    # always display the menu again
    show_menu
  end
end
