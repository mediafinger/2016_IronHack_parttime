class Board
  include BoardFromFile

  def initialize(filename = nil)
    @board = if filename # this logic is in the module BoardFromFile
               positions = load_positions(filename)
               setup_board(positions)
             else
               setup_board_default
             end
  end

  def at(position)
    @board[position.to_s]
  end

  def field_available?(current_position, new_position)
    moving_piece = at(current_position)
    standing_piece = at(new_position)

    return false if standing_piece && moving_piece && standing_piece.color == moving_piece.color

    true
  end

  # TODO - write an implementation
  # needed for the complex moves
  # tip: all pieces move in a straight line
  # the only exception (the knight) jumps over all the fields anyway
  def path_empty?(current_position, new_position)
    false # replace this with your implementation
  end

  # TODO - write an implementation
  def first_piece_in_path(current_position, new_position)
    # return position and piece
  end

  # black and white have changed sides to stay consistent with .txt inputs
  def setup_board_default
    {
      "a1" => Rook.new(:black, "a1"),
      "b1" => Knight.new(:black, "b1"),
      "c1" => Bishop.new(:black, "c1"),
      "d1" => Queen.new(:black, "d1"),
      "e1" => King.new(:black, "e1"),
      "f1" => Bishop.new(:black, "f1"),
      "g1" => Knight.new(:black, "g1"),
      "h1" => Rook.new(:black, "h1"),
      "a2" => Pawn.new(:black, "a2"),
      "b2" => Pawn.new(:black, "b2"),
      "c2" => Pawn.new(:black, "c2"),
      "d2" => Pawn.new(:black, "d2"),
      "e2" => Pawn.new(:black, "e2"),
      "f2" => Pawn.new(:black, "f2"),
      "g2" => Pawn.new(:black, "g2"),
      "h2" => Pawn.new(:black, "h2"),
      # it don't matter if you're black or white!
      "a7" => Pawn.new(:white, "a7"),
      "b7" => Pawn.new(:white, "b7"),
      "c7" => Pawn.new(:white, "c7"),
      "d7" => Pawn.new(:white, "d7"),
      "e7" => Pawn.new(:white, "e7"),
      "f7" => Pawn.new(:white, "f7"),
      "g7" => Pawn.new(:white, "g7"),
      "h7" => Pawn.new(:white, "h7"),
      "a8" => Rook.new(:white, "a8"),
      "b8" => Knight.new(:white, "b8"),
      "c8" => Bishop.new(:white, "c8"),
      "d8" => Queen.new(:white, "d8"),
      "e8" => King.new(:white, "e8"),
      "f8" => Bishop.new(:white, "f8"),
      "g8" => Knight.new(:white, "g8"),
      "h8" => Rook.new(:white, "h8"),
    }
  end
end
