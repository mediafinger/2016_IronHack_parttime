require_relative "./counter.rb"
require_relative "./transformer.rb"

class Login
  def initialize
    @users = { "andreas" => "foobar"}
  end

  def prompt
    print "please enter your name:"
    name = gets.chomp
    print "please enter your password:"
    password = gets.chomp

    if check_login(name, password)
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
      Counter.count_words
    when "b"
      Counter.count_characters
    when "c"
      Transformer.reverse
    when "d"
      Transformer.downcase
    when "e"
      Transformer.upcase
    else
      show_menu
    end
  end

  def check_login(name, password)
    @users[name] == password
  end
end
