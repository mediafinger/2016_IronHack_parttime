# loading this file, will load all Ruby files of the app
# check "app.rb" if you don't believe me!
#
load "app.rb"

class TestMoves
  def initialize
    @board = Board.new
  end

  # You could load a file with a new board to test the simple moves
  # (but I hardcoded the starting position into the Board's initialize method)
  #
  # bR bN bB bQ bK bB bN bR
  # bP bP bP bP bP bP bP bP
  # -- -- -- -- -- -- -- --
  # -- -- -- -- -- -- -- --
  # -- -- -- -- -- -- -- --
  # -- -- -- -- -- -- -- --
  # wP wP wP wP wP wP wP wP
  # wR wN wB wQ wK wB wN wR
  #
  def test_simple_moves
    test_moves load_moves("simple_moves.txt")
  end

  # Load a file with a new board to test the complex moves
  # (or just create a new hash or 2-dimensional array,
  # as I assume you know how to read files by now)
  #
  # bK -- -- -- -- bB -- --
  # -- -- -- -- -- bP -- --
  # -- bP wR -- wB -- bN --
  # wN -- bP bR -- -- -- wP
  # -- -- -- -- wK wQ -- wP
  # wR -- bB wN wP -- -- --
  # -- wP bQ -- -- wP -- --
  # -- -- -- -- -- wB -- --
  #
  def test_complex_moves
    test_moves load_moves("complex_moves.txt")
  end

  def test_moves(moves)
    moves.each do |move|
      print "#{move} "
      piece = @board.at(move.first)
      print "(#{piece.color} #{piece.class}) ==> " if piece

      if piece && @board.field_available?(move.first, move.last) && piece.move_valid?(move.last)
        puts "LEGAL"
      else
        puts "ILLEGAL"
      end
    end
  end

  def load_moves(filename)
    moves = []

    File.open(filename, "r").each_line do |line|
      moves << line.split(" ")
    end

    moves
  end
end

# execute the Test(s)

tm = TestMoves.new
tm.test_simple_moves

# puts "-" * 30
# tm.test_complex_moves

# Output of test_simple_moves should be:
# LEGAL
# LEGAL
# ILLEGAL
# LEGAL
# LEGAL
# ILLEGAL
# ILLEGAL
# LEGAL
# LEGAL
# ILLEGAL
# LEGAL
# ILLEGAL
