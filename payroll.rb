class Payroll
  def initialize(employees)
    @employees = employees
  end

  def pay_employees
    @employees.each do |employee|
      puts "#{employee.name} => #{employee.calculate_salary}"
    end
  end
end
