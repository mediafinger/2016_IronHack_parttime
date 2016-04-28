require "sinatra"

require_relative "lib/authentication.rb"

# we have to include this to be able to
# use more than the GET and POST requests browsers understand
# (DELETE, PUT, PATCH ...)
use Rack::MethodOverride

# to save information between requests
# e.g. the current_user, items of a shopping cart...
# just access the Hash session in the actions or views
enable :sessions

get "/" do
  @current_user = session.fetch("current_user")
  erb :home
end

get "/login" do
  erb :login
end

get "/logout" do
  erb :logout
end

# this route uses the post method which means it expects data from a form
post "/session" do
  # passing values form the Hash params to a clas that handles Authentication
  user = Authentication.new.login(params["username"], params["password"])

  if user
    session["current_user"] = user
    redirect back
  else
    redirect to(:login)
  end
end

# another route to /session, but using a different http method (delete)
delete "/session" do
  session.clear
  redirect to("/".to_sym)
end
