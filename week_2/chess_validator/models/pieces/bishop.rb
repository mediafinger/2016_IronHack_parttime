class Bishop < Piece
  def move_valid?(new_position)
    move = Move.new(@position, new_position)

    move.diagonal?
  end
end
