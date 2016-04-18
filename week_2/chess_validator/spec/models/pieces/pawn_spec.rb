describe Pawn do
  # we do not need a real instance of Board to test the Pawn
  # so we reate a mock object that always returns nil when
  # a pawn call at(position)
  let(:board_class) do
    Class.new do
      def initialize; end
      def at(_pos); nil; end
    end
  end

  let(:board) { board_class.new }
  let(:pawn) { Pawn.new(:white, "f4", board) }

  describe ".new" do
    it "instantiates a Pawn object" do
      expect(pawn.class).to eql Pawn
    end

    it "sets the color to white" do
      expect(pawn).to have_attributes(:color => :white)
    end

    it "sets the color to black" do
      expect(Pawn.new(:black, "f2", @board)).to have_attributes(:color => :black)
    end
  end

  describe "#move_valid?" do
    context "the first move" do
      before do
        @starting_pawn = Pawn.new(:black, "b2", @board)
      end

      it "allows one step" do
        expect(@starting_pawn.move_valid?("b3")).to be true
      end

      it "allows two steps" do
        expect(@starting_pawn.move_valid?("b4")).to be true
      end
    end

    context "subsequent moves" do
      it "allow one step" do
        expect(pawn.move_valid?("f5")).to be true
      end

      it "forbid two steps" do
        expect(pawn.move_valid?("f6")).to be false
      end
    end

    context "any one step move to an empty field" do
      it "is valid when not changing the column" do
        expect(pawn.move_valid?("f5")).to be true
      end

      it "is invalid when changing the column" do
        expect(pawn.move_valid?("e4")).to be false
      end

      it "is invalid when changing the column" do
        expect(pawn.move_valid?("e5")).to be false
      end
    end

    context "a diagonal move to a field with an opponent" do
      # in this spec we stub a differnt result to board.at()
      # remember that board is a mocked object
      # only in this test it will return an opponent
      #
      # terms to look up: mock, stub, "expect to receive and return"
      #
      it "is allowed to strike an oponent" do
        opponent = Pawn.new(:black, "e3", board)
        expect(board).to receive(:at).and_return(opponent)

        expect(pawn.move_valid?("e3")).to be true
      end
    end

    it "more than 2 steps is invalid" do
      expect(pawn.move_valid?("f8")).to be false
    end

    context "direction" do
      pending "white pawns can only go ..."
      pending "black pawns can only go ..."
    end
  end
end
