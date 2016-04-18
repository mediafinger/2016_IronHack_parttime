class Knight < Piece
  def move_valid?(new_position)
    move = Move.new(@position, new_position)
    steps = move.column_steps.abs + move.row_steps.abs

    move.arbitrary? && steps == 3
  end
end
