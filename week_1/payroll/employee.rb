class Employee
  attr_reader :email, :name

  def initialize(name, email)
    @name = name
    @email = email
  end
end
