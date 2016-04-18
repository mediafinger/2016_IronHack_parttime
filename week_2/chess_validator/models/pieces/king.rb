class King < Piece
  def move_valid?(new_position)
    move = Move.new(@position, new_position)
    steps = move.column_steps.abs + move.row_steps.abs

    move.horizontal? || move.vertical? || move.diagonal? && (steps == 1)
  end
end
