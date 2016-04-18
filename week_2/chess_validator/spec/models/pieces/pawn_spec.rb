describe Pawn do
  before do
    @pawn = Pawn.new(:white, "b2")
  end

  describe ".new" do
    it "instantiates a Pawn object" do
      expect(@pawn.class).to eql Pawn
    end

    it "sets the color to white" do
      expect(@pawn).to have_attributes(:color => :white)
    end

    it "sets the color to black" do
      expect(Pawn.new(:black, "f2")).to have_attributes(:color => :black)
    end
  end

  describe "#move_valid?" do
    context "the first move" do
      it "passes no flag to use the default true" do
        expect(@pawn.move_valid?("b4")).to be true
      end

      it "passes true to signal the first_move" do
        expect(@pawn.move_valid?("b4", true)).to be true
      end

      it "passes false to signal it is not the first_move" do
        expect(@pawn.move_valid?("b4", false)).to be false
      end
    end

    context "any one step move" do
      it "is valid when not changing the column" do
        expect(@pawn.move_valid?("b3")).to be true
      end

      it "is invalid when changing the column" do
        expect(@pawn.move_valid?("c2")).to be false
      end

      it "is invalid when changing the column" do
        expect(@pawn.move_valid?("c3")).to be false
      end

      pending "changing the column is allowed to strike an oponent"
    end

    it "more than 2 steps is invalid" do
      expect(@pawn.move_valid?("b6")).to be false
    end
  end
end
