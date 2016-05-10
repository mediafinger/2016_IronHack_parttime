ENV["RACK_ENV"] = "test"

require "rspec"
require "rack/test"

require_relative "../app.rb" # <--- your sinatra app

# you will always need this when testing Sinatra apps with rack/test
include Rack::Test::Methods

# you will always need this when testing Sinatra apps with rack/test
def app
  Sinatra::Application
end

RSpec.configure do |conf|
end
