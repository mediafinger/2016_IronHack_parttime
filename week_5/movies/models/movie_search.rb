require "imdb"

class MovieSearch
  def initialize(search_term, limit = 9)
    @search_term = search_term
    @limit = limit
  end

  def movies
    @movies ||= query_movies
  end

  def query_movies
    query = Imdb::Search.new(@search_term)
    movies = query.movies
    movies[0..@limit-1]
  end

  def posters
    posters = movies.map do |movie|
      movie.poster
    end

    posters.compact
  end
end
