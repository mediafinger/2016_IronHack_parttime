# you will always need this
require "sinatra"

# require all the classes you want to use
require_relative "models/movie_search.rb"

get "/" do
  search = MovieSearch.new("Hunger Games")
  @posters = search.posters
  erb :posters
end

# post "/movie_search" do
#
# end
