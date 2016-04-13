class Car
  # attr_reader :cities

  def initialize(sound = "Broom")
    @sound = sound
    # @cities = []
  end

  def sound
    puts @sound
  end

  def visit(city)
    # @cities << city

    # when not passing a block, you have to close the close the File connection!
    File.open("./cities.txt", mode: "a") do |file|
      file << city + "\n"
    end
  end

  def cities
    # use .open().each_line instead of .read() to not crash your system with large files
    File.open("./cities.txt", mode: "r").each_line do |line|
      puts line
    end
  end
end
