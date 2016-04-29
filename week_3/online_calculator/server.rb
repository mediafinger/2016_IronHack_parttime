require "sinatra"

require_relative "lib/calculator.rb"

get "/" do
  erb :home
end

# iteration 2 with one form only:

get "/calculator" do
  erb :calculator
end

post "/calculate" do
  @operation = params.fetch("operation")
  @num_1 = params.fetch("num_1", 0).to_f
  @num_2 = params["num_2"].to_f

  @result = Calculator.new(@operation).calculate(@num_1, @num_2)

  # display the result below the input form
  erb :calculator
end


# Below the iteration 1 solution with multiple forms:
# it is no longer needed in iteration 2 and could be removed

post "/calculate_add" do
  @summand_1 = params.fetch("summand_1", 0).to_i
  @summand_2 = params["summand_2"].to_i

  @result = Calculator.new.add(@summand_1, @summand_2)

  erb :add_result
end

get "/add" do
  @title = "Add"
  erb :add
end

post "/calculate_add" do
  @summand_1 = params.fetch("summand_1", 0).to_i
  @summand_2 = params["summand_2"].to_i

  @result = Calculator.new.add(@summand_1, @summand_2)

  erb :add_result
end

get "/multiply" do
  @title = "Multiply"
  erb :multiply
end

post "/calculate_multiply" do
  @factor_1 = params.fetch("factor_1", 0).to_i
  @factor_2 = params["factor_2"].to_i

  @result = Calculator.new.multiply(@factor_1, @factor_2)

  erb :multiply_result
end
