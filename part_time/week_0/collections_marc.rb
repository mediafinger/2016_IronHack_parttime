require "pry"

puts "Home Assignment: TextBnB"

class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

class TextBnB
  def initialize
    @homeDDBB = []
  end

  def add_home(home)
		@homeDDBB.push(home)
  end

  def sort_price_ascendent
    puts "Here you have the houses sorted by price ascendent."
    price_lowFirst = @homeDDBB.sort_by { |home| home.price }
    price_lowFirst.each { |home| puts "#{home.name} is #{home.price}€ per night." }
  end

  def sort_choices
    puts "How do you want to sort the houses: by [P]rice descendent OR by [C]apacity?"
    answer = gets.chomp
    if answer == "P"
      price_lowFirst = @homeDDBB.sort_by { |home| home.price }
      price_highFirst = price_lowFirst.reverse
      puts "Here you have the houses sorted by price descendent."
      price_highFirst.each { |home| puts "#{home.name} is #{home.price}€ per night." }
    elsif answer == "C"
      capacity_lowFirst = @homeDDBB.sort_by { |home| home.capacity }
      puts "Here you have the houses sorted by price descendent."
      capacity_lowFirst.each { |home| puts "#{home.name} can host up to #{home.capacity} people." }
    else
      puts "Sorry, but I just understand [P] or [C]"
    end
  end

  def search_by_city
    puts "Now tell me in which city do you want to look for houses."
    input_city = gets.chomp
    city_homes = @homeDDBB.select { |home| home.city == input_city.capitalize }
    if city_homes != []
      puts "Here are the houses in #{input_city}"
      city_homes.each { |home| puts "* #{home.name}" }
    else
      puts "Sorry, right now there are no houses available in #{input_city.capitalize}"
    end
  end
  def average_price

    cities = []
    @homeDDBB.each do |home|
      cities << home.city
    end

    cities = @homeDDBB.map { |home| home.city }

    prices = @homeDDBB.map do |home|
      home.price
    end

    capacities = @homeDDBB.map {
      |home| home.capacity
    }
    total_price = prices.reduce(0.0){ |sum,x| sum + x }

    num_cities = cities.length
    avg_price = total_price / num_cities
    puts "The average price calculated w/ 'reduce' is #{avg_price}."
  end
  def match_price
    puts "Enter the price that you want to pay:"
    price_target = gets.chomp.to_i
    price_match = @homeDDBB.find { |home| home.price == price_target }
    puts "#{price_match.name} costs exactly #{price_match.price}€ per night."
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Patrick's place", "Dublin", 2, 53),
  Home.new("Andrea's place", "Munich", 9, 91),
  Home.new("Claudia's place", "Tokyo", 3, 78),
  Home.new("Marc's place", "Barcelona", 1, 51),
  Home.new("Alberto's place", "Amsterdam", 7, 89)
]
homesBnB = TextBnB.new
homes.each { |home| homesBnB.add_home(home) }

# homesBnB.sort_price_ascendent
# homesBnB.sort_choices
# homesBnB.search_by_city
# homesBnB.average_price
# homesBnB.match_price
