require "employee"
require "hourly_employee"
require "salaried_employee"
require "multi_payment_employee"
require "payroll"

class PayrollCalculation
  def self.run
    payroll = Payroll.new(employees)

    payroll.pay_employees
  end

  def self.employees
    josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
    nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
    ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

    [josh, nizar, ted]
  end
end
