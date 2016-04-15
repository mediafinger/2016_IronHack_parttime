class Board
  def initialize
    @board = {
      "a1" => Rook.new(:white, "a1"),
      "b1" => Knight.new(:white, "b1"),
      "c1" => Bishop.new(:white, "c1"),
      "d1" => Queen.new(:white, "d1"),
      "e1" => King.new(:white, "e1"),
      "f1" => Bishop.new(:white, "f1"),
      "g1" => Knight.new(:white, "g1"),
      "h1" => Rook.new(:white, "h1"),
      "a2" => Pawn.new(:white, "a2"),
      "b2" => Pawn.new(:white, "b2"),
      "c2" => Pawn.new(:white, "c2"),
      "d2" => Pawn.new(:white, "d2"),
      "e2" => Pawn.new(:white, "e2"),
      "f2" => Pawn.new(:white, "f2"),
      "g2" => Pawn.new(:white, "g2"),
      "h2" => Pawn.new(:white, "h2"),
      # it don't matter if you're black or white!
      "a7" => Pawn.new(:black, "a7"),
      "b7" => Pawn.new(:black, "b7"),
      "c7" => Pawn.new(:black, "c7"),
      "d7" => Pawn.new(:black, "d7"),
      "e7" => Pawn.new(:black, "e7"),
      "f7" => Pawn.new(:black, "f7"),
      "g7" => Pawn.new(:black, "g7"),
      "h7" => Pawn.new(:black, "h7"),
      "a8" => Rook.new(:black, "a8"),
      "b8" => Knight.new(:black, "b8"),
      "c8" => Bishop.new(:black, "c8"),
      "d8" => Queen.new(:black, "d8"),
      "e8" => King.new(:black, "e8"),
      "f8" => Bishop.new(:black, "f8"),
      "g8" => Knight.new(:black, "g8"),
      "h8" => Rook.new(:black, "h8"),
    }
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
end
