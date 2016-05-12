require_relative "../spec_helper.rb"

describe MovieSearch do
  describe "#movie_list" do
    let(:search) { MovieSearch.new("Hunger Games") }

    # RSpec Test double
    # https://www.relishapp.com/rspec/rspec-mocks/docs
    let(:movie) { double("Movie", poster: "http://www.example.com", year: 2000) }
    let(:movie_without_poster) { double("Movie", poster: nil, year: 1999) }

    context "when all movies have posters" do
      let(:movies) {
        movies = []
        9.times { movies.push(movie) }
        movies
      }

      it "returns an array of 9 elements" do
        # RSpec method stub
        # https://www.relishapp.com/rspec/rspec-mocks/docs
        allow(search).to receive(:movies) { movies }

        expect(search.movie_list.count).to eql(9)
      end
    end

    context "when not all movies have posters" do
      let(:movies) {
        movies = []
        8.times { movies.push(movie) }
        movies.push(movie_without_poster)
        movies
      }

      it "returns an array of 8 elements" do
        allow(search).to receive(:movies) { movies }

        expect(search.movie_list.count).to eql(8)
      end
    end
  end
end
