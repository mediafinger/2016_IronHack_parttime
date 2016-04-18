class Pawn < Piece
  def move_valid?(new_position, first_move = true)
    move = Move.new(@position, new_position)
    steps = move.column_steps.abs + move.row_steps.abs

    # TODO allow diagonal move to strike oponent

    if first_move
      move.vertical? && (steps == 1 || steps == 2)
    else
      move.vertical? && (steps == 1)
    end
  end
end
