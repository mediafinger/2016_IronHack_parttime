require "cell"

describe Cell do
  describe "#regenerate" do
    #
    # Write the test cases for all living cells in this context:
    #
    context "a living cell" do
      context "dies" do
        it "when it has 0 neighbours" do
          cell = Cell.new(1, [0, 0, 0, 0, 0, 0, 0, 0])

          expect(cell.regenerate).to eql(0)
        end

        it "when it has 1 neighbour" do
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
