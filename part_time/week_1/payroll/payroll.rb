class Payroll
  INCOME_TAX = 18.0

  def initialize(employees)
    @employees = employees
  end

  def pay_employees
    @employees.each do |employee|
      salary = employee.calculate_salary * (1 + INCOME_TAX / 100)

      puts "#{employee.name} => #{salary}"

      notify_employees(employee, salary)
    end
  end

  def notify_employees(employee, salary)
    # Email.send(
    #   subject: "Payment sent",
    #   recipient: employee.name,
    #   email: employee.email,
    #   body: "Hello we paid you #{salary}"
    # )
  end
end

#
# class Email
#   def self.send(subject:, recipient:, email:, body:)
#   end
# end
