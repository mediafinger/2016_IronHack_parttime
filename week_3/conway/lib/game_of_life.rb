require_relative "./cell.rb"

class GameOfLife
  def initialize(options = {})
    @height = options.fetch(:height, 10)
    @width = options.fetch(:height, 10)

    # you might need this (and more) input arguments
    # @generations = options.fetch(:generations, 5)

    @grid = fill_grid_with_cells(setup_grid)
  end

  # GameOfLife.new(...).run is how the game should be started
  # but the visualization with `puts` will only be implemented
  # in the 4th iteration
  #
  def run
    # obviously we will have to iterate over the 2-dimensional grid
    # output its current state, regenerate the cells,
    # output its current state, regenerate the cells,
    # output its current state, regenerate the cells,
    # ... and so on, you get the idea
    #
    # here some commands you might find helpful:
    # (replace them with your method implementation)
    # (and adapt the tests to match your code)
    #
    system "clear" # removes all output from the terminal
    puts "hello"
    sleep(2) # waits 2 seconds
    puts "bye"
  end

  # setup_grid creates a 2-dimensional array
  # in the size of @height and @width
  # and sets every element to 0 or 1
  def setup_grid
    Array.new(@height) do
      Array.new(@width) do
        rand(0..1)
      end
    end
  end

  # fill_grid_with_cells replaces every 0 or 1 with an instance of Cell
  # this method is only used in the instantiation / setup process
  def fill_grid_with_cells(grid)
    grid.each_with_index do |row, x|
      row.each_with_index do |element, y|
        Cell.new(element, neighbours(grid, x, y))
      end
    end
  end

  # return an Array containing the 3 - 8 neighbours of x/y in the grid
  # something like: [0, 0, 1, 0, 1, 0, 0, 1]
  def neighbours(grid, x, y)
  end
end
