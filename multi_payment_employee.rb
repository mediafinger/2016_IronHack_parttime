class MultiPaymentEmployee < Employee
  def initialize(name, email, yearly_salary, hourly_rate, hours_worked)
    @name = name
    @email = email
    @yearly_salary = yearly_salary
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

  def calculate_salary
    extra_hours_bonus = 0

    if @hours_worked > 40
      extra_hours_bonus = (@hours_worked - 40) * @hourly_rate
    end

    @yearly_salary / 52 + extra_hours_bonus
  end
end
