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

  def movie_list
    list = movies.map do |movie|
      next unless movie.poster

      {
        poster: movie.poster,
        year:   movie.year,
      }
    end

    list.compact
  end
end
