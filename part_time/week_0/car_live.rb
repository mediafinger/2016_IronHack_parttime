class Car
  include CarFunctionality

  def initialize(sound = "broom")
    @sound = sound
    @cities = []
  end
end
