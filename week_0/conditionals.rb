age = 32
name = "Toni"

puts "#{name} is #{age} years old."

if age < 18
  puts "Too young you baby!!!"
elsif age <= 29
  puts "A twen."
else
  puts "You are in your best years!"
end

puts "You are legally allowed to drink" if age > 25
# unless == if not
puts "You are really old" unless age < 45

# The following 3 lines of code all do the same
# but only the first line is nice to read
puts "You are the teacher" if name == "Andreas"
puts "You are the teacher" unless name != "Andreas"
puts "You are the teacher" unless not name == "Andreas"

puts "You are a student" if name == "Marc" || name == "Toni"
