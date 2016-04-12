class VehicleServiceForWheels
  def initialize(vehicles)
    # we expect an Array of Vehicles
    @vehicles = vehicles
  end

  def count_wheels
    @vehicles.reduce(0) do |sum, vehicle|
      sum + vehicle.wheels
    end
  end
end

class VehicleServiceForNoises
  def initialize(vehicles)
    # we expect an Array of Vehicles
    @vehicles = vehicles
  end

  def print_noises
    @vehicles.each do |vehicle|
      puts vehicle.noise
    end
  end
end
