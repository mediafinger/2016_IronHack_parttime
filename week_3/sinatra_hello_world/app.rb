# you will always need this
require "sinatra"

# require all the classes you want to use
require_relative "models/hello_world.rb"

# directly pass a string to erb to interpret is as ruby and yield it
# check views/layout.erb to see how the rest of the page will look like
#
get "/" do
  erb "<a href='/hello'>Click me!</a>"
end

# set a value to an @instance variable to use it in the views
# extract logic to classes
# pass the name of the view to erb - you need a file with this name under views/
#
get "/hello" do
  @message = HelloWorld.new.message
  erb :hello_world
end
