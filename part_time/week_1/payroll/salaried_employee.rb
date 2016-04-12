class SalariedEmployee < Employee
  include YearlyPayable

  def initialize(name, email, yearly_salary)
    @name = name
    @email = email
    @yearly_salary = yearly_salary
  end

  def calculate_salary
    calculate_with_yearly_salary
  end
end
