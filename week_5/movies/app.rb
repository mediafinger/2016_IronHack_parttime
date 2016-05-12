# you will always need this
require "sinatra"

# require all the classes you want to use
require_relative "models/movie_search.rb"
require_relative "models/randomizer.rb"

get "/" do
  erb :form
end

post "/" do
  search = MovieSearch.new(params["search_term"])
  @movies = search.movie_list
  @year = Randomizer.new(@movies).year
  erb :posters
end
