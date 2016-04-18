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
      "a1" => Rook.new(:black, "a1", self),
      "b1" => Knight.new(:black, "b1", self),
      "c1" => Bishop.new(:black, "c1", self),
      "d1" => Queen.new(:black, "d1", self),
      "e1" => King.new(:black, "e1", self),
      "f1" => Bishop.new(:black, "f1", self),
      "g1" => Knight.new(:black, "g1", self),
      "h1" => Rook.new(:black, "h1", self),
      "a2" => Pawn.new(:black, "a2", self),
      "b2" => Pawn.new(:black, "b2", self),
      "c2" => Pawn.new(:black, "c2", self),
      "d2" => Pawn.new(:black, "d2", self),
      "e2" => Pawn.new(:black, "e2", self),
      "f2" => Pawn.new(:black, "f2", self),
      "g2" => Pawn.new(:black, "g2", self),
      "h2" => Pawn.new(:black, "h2", self),
      # it don't matter if you're black or white!
      "a7" => Pawn.new(:white, "a7", self),
      "b7" => Pawn.new(:white, "b7", self),
      "c7" => Pawn.new(:white, "c7", self),
      "d7" => Pawn.new(:white, "d7", self),
      "e7" => Pawn.new(:white, "e7", self),
      "f7" => Pawn.new(:white, "f7", self),
      "g7" => Pawn.new(:white, "g7", self),
      "h7" => Pawn.new(:white, "h7", self),
      "a8" => Rook.new(:white, "a8", self),
      "b8" => Knight.new(:white, "b8", self),
      "c8" => Bishop.new(:white, "c8", self),
      "d8" => Queen.new(:white, "d8", self),
      "e8" => King.new(:white, "e8", self),
      "f8" => Bishop.new(:white, "f8", self),
      "g8" => Knight.new(:white, "g8", self),
      "h8" => Rook.new(:white, "h8", self),
    }
  end
end
