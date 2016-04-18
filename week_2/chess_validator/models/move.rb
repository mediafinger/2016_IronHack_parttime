class NotValidPositonError < StandardError; end

class Move
  COLUMNS = %w(a b c d e f g h).freeze
  ROWS = (1..8).to_a.freeze

  def initialize(current_position, new_position)
    @current_position = validate_position(current_position)
    @new_position = validate_position(new_position)
  end

  def no_move?
    same_column? && same_row?
  end

  def vertical?
    same_column? && different_row?
  end

  def horizontal?
    same_row? && different_column?
  end

  def diagonal?
    different_column? && different_row? && (column_steps.abs == row_steps.abs)
  end

  def arbitrary?
    different_column? && different_row? && (column_steps.abs != row_steps.abs)
  end

  def column_steps
    column(@current_position).ord - column(@new_position).ord
  end

  def row_steps
    row(@current_position) - row(@new_position)
  end

  private

  def same_column?
    column_steps == 0
  end

  def different_column?
    !same_column?
  end

  def same_row?
    row_steps == 0
  end

  def different_row?
    !same_row?
  end

  def column(position)
    position.to_s[0]
  end

  def row(position)
    position.to_s[1].to_i
  end

  def validate_position(position)
    fail NotValidPositonError, "For: #{position}" unless COLUMNS.include? column(position)
    fail NotValidPositonError, "For: #{position}" unless ROWS.include? row(position)

    position
  end
end
