require_relative "./car.rb"

class RacingCar < Car
  RACING_CAR_SOUND = "BROOOOOM".f

  def initialize(sound = RACING_CAR_SOUND)
    super
    @sound = RACING_CAR_SOUND
  end
end
