class Randomizer
  def initialize(movie_list)
    @movie_list = movie_list
  end

  def year
    years = @movie_list.map do |movie|
      movie[:year]
    end

    years.sample
  end
end
