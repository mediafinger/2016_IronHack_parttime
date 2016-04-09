class HourlyEmployee < Employee
  def initialize(name, email, hourly_rate, hours_worked)
    @name = name
    @email = email
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

  def calculate_salary
    @hourly_rate * @hours_worked
  end
end
