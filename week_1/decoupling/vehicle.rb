module Vehicle
  attr_reader :wheels, :noise

  def setup(wheels, noise)
    @wheels = wheels
    @noise = noise
  end
end

class VehicleCar
  include Vehicle

  def initialize
    setup(4, "wroooommm")
  end
end

class VehicleMotorbike
  include Vehicle

  def initialize
    setup(2, "rrrrrrrr")
  end
end
