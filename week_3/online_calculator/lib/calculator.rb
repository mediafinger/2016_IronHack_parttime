class Calculator
  def initialize(operation = "+")
    @operation = operation.to_sym
  end

  # n1 and n2 are Integers or Floats
  # operation is a symbol like :+ or :*
  # n.public_send(:method_name, parameter) calls a method on n and passes it a paramter
  # --> n1.public_send(@operation, n2) called with real values like:
  # 5.public_send(:+, 3) will execute:
  # 5 + 3
  def calculate(n1, n2)
    n1.public_send(@operation, n2)
  end


  # the following methods are only needed in Iteration 1
  # Iteration 2 only uses the initializer and the calculate method

  def add(s1, s2)
    s1 + s2
  end

  def multiply(f1, f2)
    f1 * f2
  end
end
