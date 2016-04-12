require_relative "./word_count.rb"

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
      WordCount.count
    else
      puts "Try again"
      prompt
    end
  end

  private

  def check_login(name, password)
    @users[name] == password
  end
end
