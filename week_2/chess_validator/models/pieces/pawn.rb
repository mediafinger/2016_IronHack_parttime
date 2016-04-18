class Pawn < Piece
  STARTING_ROW = {
    :black => 2,
    :white => 7,
  }.freeze

  # TODO add direction check dependent on color
  def move_valid?(new_position)
    move = Move.new(@position, new_position)
    steps = move.column_steps.abs + move.row_steps.abs

    normal_step(move, steps) ||
      opening_step(move, steps) ||
      step_to_strike(move, steps, new_position)
  end

  private

  def normal_step(move, steps)
    move.vertical? && steps == 1
  end

  def opening_step(move, steps)
    first_move = STARTING_ROW[@color] == move.row(@position)

    move.vertical? && first_move && steps == 2
  end

  def step_to_strike(move, steps, new_position)
    # The only time any Piece makes a call to @board
    # there must be a way to refactor this
    #
    piece_on_destination = @board.at(new_position)

    move.diagonal? &&
      !piece_on_destination.nil? &&
      piece_on_destination.color != @color &&
      steps == 2 # one row + one column
  end
end
