require_relative "./string_operations.rb"

class Login
  # open-closed principle example
  # you could now inherit from Login into a class MyLogin
  # and only overwrite the initialize method to use other operations
  #
  # class MyLogin < Login
  #   def initialize
  #     @operations = MathOperations.new
  #   end
  # end
  #
  # this way the class is open for extension, but closed for modifications
  #
  def initialize
    @operations = StringOperations.new
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

      @operations.show_menu
    else
      puts "Try again"
      prompt
    end
  end
end
