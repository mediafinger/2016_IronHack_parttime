describe Board do
  before do
    @board = Board.new
  end

  describe ".new" do
    context "when not passing a filename" do
      it "instantiates a Board object" do
        expect(@board.class).to eql Board
      end
    end

    context "when passing a filename" do
      it "instantiates a Board object" do
        board = Board.new("starting_positions.txt")

        expect(board.class).to eql Board
      end
    end
  end

  describe "#at" do
    context "empty field" do
      it { expect(@board.at("a5")).to be nil }
    end

    context "invalid argument" do
      it { expect(@board.at("z10")).to be nil }
      it { expect(@board.at(42)).to be nil }
      it { expect(@board.at(["a2"])).to be nil }
    end

    context "occupied position" do
      it { expect(@board.at(:a1)).to be_truthy }
      it { expect(@board.at("h8")).to be_truthy }

      it { expect(@board.at("a1").class).to be Rook }
      it { expect(@board.at("b2").class).to be Pawn }
      it { expect(@board.at("b2").color).to be :black }
      it { expect(@board.at(:f8).color).to be :white }
    end
  end

  describe "#field_available?" do
    it { expect(@board.field_available?("a2", "a3")).to be true }
    it { expect(@board.field_available?("a1", "a7")).to be true }
    it { expect(@board.field_available?("g1", "h3")).to be true }

    it { expect(@board.field_available?("a2", "a1")).to be false }
    it { expect(@board.field_available?("f1", "e2")).to be false }
  end

  describe "#path_empty?" do
    pending { expect(@board.path_empty?("a2", "a4")).to be true }
    pending { expect(@board.path_empty?("g1", "h3")).to be true }

    it { expect(@board.path_empty?("a1", "a7")).to be false }
    it { expect(@board.path_empty?("a1", "c1")).to be false }
    it { expect(@board.path_empty?("h8", "e5")).to be false }
  end

  describe "#first_piece_in_path?" do
    context "when the path is empty" do
      it { expect(@board.first_piece_in_path("a2", "a4")).to be nil }
      it { expect(@board.first_piece_in_path("g1", "h3")).to be nil }
    end

    context "when a piece is in the path" do
      pending { expect(@board.first_piece_in_path("a1", "c1")).to eql @board.at("b1") }
      pending { expect(@board.first_piece_in_path("a2", "a8")).to eql @board.at("a7") }
      pending { expect(@board.first_piece_in_path("f1", "d3")).to eql @board.at("e2") }
    end
  end
end
