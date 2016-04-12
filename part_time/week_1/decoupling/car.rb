class Car
  def initialize(engine)
    @engine = engine
  end

  def start
    "#{noise} ... #{@engine.noise}"
  end

  def noise
    "wroooom"
  end
end
