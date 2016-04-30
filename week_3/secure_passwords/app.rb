require "sinatra"
require "sinatra/reloader" if development?

require_relative "lib/password_checker.rb"

get "/" do
  erb :login
end

post "/login" do
  email = params["email"]
  password = params["password"]

  if PasswordChecker.new.check_password?(email, password)
    redirect to(:congratulations)
  else
    redirect to("/")
  end
end

get "/congratulations" do
  erb :congratulations
end
