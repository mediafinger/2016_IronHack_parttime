class Queen < Piece
  def move_valid?(new_position)
    move = Move.new(@position, new_position)

    move.horizontal? || move.vertical? || move.diagonal?
  end
end
