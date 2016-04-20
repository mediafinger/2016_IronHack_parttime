class Cell
  attr_reader :state

  def initialize(state, neighbours)
    @state = state # 1 for alive || 0 for dead
    @neighbours = neighbours # an array that represents the surrounding cells
  end

  # 1. Any living cell with 0 or 1 living neighbours dies (caused by under-population)
  # 2. Any living cell with 2 or 3 living neighbours stays alive
  # 3. Any living cell with 4 or more living neighbours dies (caused by over-population)
  # 4. Any _dead_ cell with exactly 3 living neighbours becomes alive (caused by reproduction)
  def regenerate
    # your implementation code here
  end

  def count_neighbours
    # extract functionality to its own method
  end
end
