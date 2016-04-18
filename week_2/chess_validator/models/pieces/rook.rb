class Rook < Piece
  def move_valid?(new_position)
    move = Move.new(@position, new_position)

    move.horizontal? || move.vertical?
  end
end
