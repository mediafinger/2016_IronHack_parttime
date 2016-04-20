# Conway's Game of Life

This game simplifies our existential questions into a few simple rules of life and death. The rules of the game are:

1. Any living cell with 0 or 1 living neighbours dies (caused by under-population)
2. Any living cell with 2 or 3 living neighbours stays alive
3. Any living cell with 4 or more living neighbours dies (caused by over-population)
4. Any _dead_ cell with exactly 3 living neighbours becomes alive (caused by reproduction)

The game takes place in a grid (which can be any size). Each cell has 3 - 8 neighbours (horizontal, vertical, and diagonal). The survival of each cell depends on its neighbours. The initial pattern of the grid is random.

In each round of the game, the cells in the grid re-generate according to the rules of the game we just described. It is important to note that the rules are applied simultaneously to every cell in the grid.

More information here: <http://en.wikipedia.org/wiki/Conway's_Game_of_Life>

The game of live and death is pretty cool, so let's implement it! And now we know about TDD we obviously want to follow the **[ red ] [ green ] [ refactor ] [ commit ] cycle!**


## Iteration 1: The Cell
Create a class that handles the logic of the game for a single cell and write it using TDD. Here is a class skeleton and some tests you can use to get you started.

```ruby
# lib/cell.rb

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
```

And the first test cases. Two of them fail - so these are your starting point to implement functionality.

One test case is `pending` - that means it does not make your tests go _red_ but the code is also not implemented yet. Whenever you are ready to work on the dead cells, replace `pending` by `it` and the test will run normally (and fail).

```ruby
# spec/cell_spec.rb

require "cell"

describe Cell do
  describe "#regenerate" do
    #
    # Write the test cases for all living cells in this context:
    #
    context "a living cell" do
      context "given 0 or 1 neigbours" do
        it "dies" do
          cell = Cell.new(1, [0, 0, 0, 0, 0, 0, 0, 0])

          expect(cell.regenerate).to eql(0)
        end

        it "dies" do
          cell = Cell.new(1, [0, 0, 0, 0, 0, 0, 0, 1])

          expect(cell.regenerate).to eql(0)
        end
      end
    end
    # ----- end of living context -----

    #
    # Write the test cases for all dead cells in this context:
    #
    # notice that one test is marked as "pending"
    # just replace "pending" with "it" whenever you are ready to implement this logic
    #
    context "a dead cell" do
      context "given 3 neigbours" do
        pending "turns to live" do
          cell = Cell.new(0, [1, 1, 1, 0, 0, 0, 0, 0])

          expect(cell.regenerate).to eql(1)
        end
      end
    end
    # ----- end of dead context -----
  end
end
```

Don't forget to write tests first and then the code.

And commit when you successfully implemented new functionality.

## Iteration 2: Create a grid

Create a grid to represent the game. Assign a cell to each element in the grid. Each cell has to be either alive or dead.

> Take some time to think about a possible implementation. How would you create the grid? How would you ensure that each element is an instance of Cell?

If you are stuck (or just want to see how I would have done it) you find a skeleton of the `GameOfLife` class and it's spec in the repository. You can use it as your starting point - beware though that the spec is not testing much yet, you have to write the tests for the existing and future methods.

> Remember the **[ red ] [ green ] [ refactor ] [ commit ] cycle**!


## Iteration 3: Regenerate the grid

Now we want to see the cells change in each generation. We have to run iterations of the game, to see the evolution of generations of cells.

We start by adding tests to confirm that the iterations are regenerating the cells according to the rules of the game. (Tip: use small grids in your tests.)

We don't want the game to run without end. So we need to be able to pass the number of generations to it.


## Iteration 4: Visualize the game

Now that we implemented the whole logic and ensured with our tests that it works, it is time to visualize the game. This should now be a rather simple step, as the hardest work has already been done.

Create a visual representation of the game. Every living cell should be visible in the output (by something else than a 1) and every dead cell should be invisible.

**Hint:**

 * use `system "clear"` to clear the screen after one generation.
 * use `sleep(x)` to wait for x seconds before clearing the screen

Bonus: once you managed to achieve this, you could make the visualization configurable to find a version you like more.


## Have fun!

And check out the sheer infinite results those four simple rules can generate - given the right seed (initial grid).

<https://youtu.be/C2vgICfQawE?t=1m4s>
