# This is a refactoring of the previous example
# 3 classes (Person, Directory, CreateDirectory) are introduced
# the last line: >>CreateDirectory.new.run<< will execute the program
#
# It is a lot more code and looks way more complex than the
# previous procedural version without classes.
# Just take it as an example how a program with classes can look like.

class Person
  def initialize(name, role)
    @name = name
    @role = role.downcase
  end

  # the name "to_s" is a Ruby convention and always used
  # when an Object should be presented as a String / be printed
  def to_s
    "#{@name} is a #{@role}."
  end
end


class Directory
  def initialize()
    # We do not allow to access @list from outside this class directly
    # so we keep full control how elements are added, that none are removed, etc...
    @list = []
  end

  def <<(element)
    @list << element
  end

  def count
    @list.count
  end

  def to_s
    # Array.join iterates over all elements
    # and concatenates them with the given argument "\n"
    # to a String
    # This will automatically call the to_s method of each element (in this example: our class Person)
    @list.join("\n")
  end
end


class CreateDirectory
  # This method controls the whole program following
  # it calls the methods that take the user input
  # display the list and so on...
  def run
    people = Directory.new

    puts "Hello"

    until @abort do
      person = get_input
      people << Person.new(person[:name], person[:role])

      check_abort
    end

    show_result(people)
  end

  # all methods below this keyword can not be called from outside
  private

  def get_input
    puts "Please input a name:"
    name = gets.chomp

    puts "Please input the role: (e.g. teacher, student ...)"
    role = gets.chomp.downcase

    # return value:
    { :name => name, :role => role}
  end

  def check_abort
    puts "Do you want to enter another person? (Yes / No)"
    @abort = gets[0].downcase != "y"
  end

  def show_result(people)
    puts "\nYou entered those #{people.count} people:"
    puts people
    puts "\nkthxbye"
  end
end


# call the program:
CreateDirectory.new.run
