# "#{Dir.pwd}/models/**/*.rb" finds all *.rb files of the project
# - Dir.pwd the absolute path to the current directory
# - the subfolder "models/"
# - all subfolders of models "**/"
# - files with the suffix "*.rb"
#
Dir["#{Dir.pwd}/lib/**/*.rb", "#{Dir.pwd}/models/**/*.rb"].each { |file| require_relative file }

# This file is almost the same as test_moves.rb
# comments have been removed for readability
# the methods test_move and legal_move? have been extracted from test_moves
class ChessValidator
  def initialize
    @board = Board.new
  end

  def test_simple_moves
    load_moves("simple_moves.txt")
    test_moves
  end

  def test_complex_moves
    # TODO implement loading of starting positions
    # @board = Board.new("complex_board.txt")
    # load_moves("complex_moves.txt")
    # test_moves
  end

  def test_moves(moves = @moves)
    return unless moves.is_a? Array

    moves.each do |move|
      test_move(move.first, move.last)
    end
  end

  def test_move(home, destination)
    print "#{home}, #{destination} "

    if legal_move?(home, destination)
      puts "LEGAL"
    else
      puts "ILLEGAL"
    end
  end

  def legal_move?(home, destination)
    piece = @board.at(home)

    !piece.nil? &&
      @board.field_available?(home, destination) &&
      piece.move_valid?(destination)
  end

  def load_moves(filename)
    @moves = []

    File.open(filename, "r").each_line do |line|
      @moves << line.split(" ")
    end

    @moves
  end
end
