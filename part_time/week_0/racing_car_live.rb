class RacingCar
  include CarFunctionality

  def initialize
    @sound = "BROOOOOOM"
  end

  def sponsors
  end
end

module CarFunctionality
  def sound
    puts @sound
  end

  def visit(city)
    # append city to file
    File.open("cities_db.txt", "a") do |file|
      file << city + "\n"
    end
  end

  def cities
    # read file and print all lines
    File.open("cities_db.txt", "r").each_line do |line|
      puts line
    end
  end
end
