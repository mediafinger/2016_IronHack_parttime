describe Pawn do
  before do
  end

  let(:pawn) { Pawn.new(:white, "f4") }
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

      pending "changing the column is allowed to strike an oponent"
    end

    it "more than 2 steps is invalid" do
      expect(pawn.move_valid?("f8")).to be false
    end
    end
  end
end
