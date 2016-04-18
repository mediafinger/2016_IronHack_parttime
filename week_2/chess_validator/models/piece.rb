class MethodNotImplementedError < StandardError; end

class Piece
  attr_reader :color

  def initialize(color, position)
    @color = color
    @position = position
  end

  # this method should be implemented in
  # the class that inherits from Piece
  # the class Piece itself should not be instantiated
  def move_valid?(_new_position)
    fail MethodNotImplementedError
  end
end
