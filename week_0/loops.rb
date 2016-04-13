names = [ "Andreas", "Marc", "Toni", "Nikki"]

puts "All names in our list:"

# for i in 0...names.length
names.each_with_index do |name, index|
  puts names[index]
end

puts "-" * 50

# for name in names
names.each do |name|
  print "#{name}: "
  if name == "Andreas"
    puts "You are the teacher"
  else
    puts "You are a student"
  end
end
