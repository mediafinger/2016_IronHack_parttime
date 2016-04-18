class Pawn < Piece
  STARTING_ROW = {
    :black => 2,
    :white => 7,
  }.freeze

  def move_valid?(new_position)
    move = Move.new(@position, new_position)
    steps = move.column_steps.abs + move.row_steps.abs

    # TODO allow diagonal move to strike oponent
    normal_step(move, steps) ||
      opening_step(move, steps) ||
  end

  private

  def normal_step(move, steps)
    move.vertical? && steps == 1
  end

  def opening_step(move, steps)
    first_move = STARTING_ROW[@color] == move.row(@position)

    move.vertical? && first_move && steps == 2
  end
  end
end
