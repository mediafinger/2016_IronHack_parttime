# to use Ruby's date class, we have to require it first
require "date"

class HelloWorld
  def message
    us_inauguration_date = Date.parse("2017-01-20")
    days_left = us_inauguration_date - Date.today

    "The world will end in #{days_left.to_i} days."
  end
end
