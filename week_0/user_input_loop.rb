people = []

puts "Hello"

# In the first loop @abort does not exist, so it is nil
# @abort will later be set to false or true
until @abort do  # Same as: while not @abort do
  puts "Please input a name:"
  name = gets.chomp

  puts "Please input the role: (e.g. teacher, student ...)"
  role = gets.chomp.downcase

  # Add a Hash with the information of one person
  # to the Array people
  people << { :name => name, :role => role }

  puts "Do you want to enter another person? (Yes / No)"
  # @abort is only set to true when the user input starts with "y" or "Y"
  # in all other cases @abort will be set to false
  @abort = gets[0].downcase != "y"
end

puts "\nYou entered those #{people.count} people:"

people.each do |person|
  puts "#{person[:name]} is a #{person[:role]}."
end

puts "\nkthxbye"
