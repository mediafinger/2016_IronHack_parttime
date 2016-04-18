describe Piece do
  before do
    @dummy_board = ""
    @piece = Piece.new(:white, "a1", @dummy_board)
  end

  describe ".new" do
    it "instantiates a Piece object" do
      expect(@piece.class).to eql Piece
    end

    it "sets the color to white" do
      expect(@piece).to have_attributes(:color => :white)
    end

    it "sets the color to black" do
      expect(Piece.new(:black, "f2", @dummy_board)).to have_attributes(:color => :black)
    end
  end

  describe "#move_valid?" do
    it "is not implemented and throws an error" do
      expect { @piece.move_valid?("a2") }.to raise_error MethodNotImplementedError
    end
  end
end
