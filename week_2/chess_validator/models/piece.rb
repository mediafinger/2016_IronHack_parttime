class MethodNotImplementedError < StandardError; end

class Piece
  attr_reader :color

  def initialize(color, position, board)
    @color = color
    @position = position
    # the Pawn is the only class that needs to access @board
    # there might be a better way to keep the decoupling
    @board = board
  end

  # this method should be implemented in
  # the class that inherits from Piece
  # the class Piece itself should not be instantiated
  def move_valid?(_new_position)
    fail MethodNotImplementedError
  end
end
