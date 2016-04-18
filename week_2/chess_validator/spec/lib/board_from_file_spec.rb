describe "module BoardFromFile" do
  # define an anonymous class to include the module
  let(:including_class) do
    Class.new do
      include BoardFromFile
    end
  end

  let(:board) { including_class.new }

  let(:positions) {
    [
      ["bR", "bN", "bB", "bQ", "bK", "bB", "bN", "bR"],
      ["bP", "bP", "bP", "bP", "bP", "bP", "bP", "bP"],
      ["--", "--", "--", "--", "--", "--", "--", "--"],
      ["--", "--", "--", "--", "--", "--", "--", "--"],
      ["--", "--", "--", "--", "--", "--", "--", "--"],
      ["--", "--", "--", "--", "--", "--", "--", "--"],
      ["wP", "wP", "wP", "wP", "wP", "wP", "wP", "wP"],
      ["wR", "wN", "wB", "wQ", "wK", "wB", "wN", "wR"]
    ]
  }

  describe "#load_positions" do
    it "transforms the file to an Array of Arrays" do
      expect(board.load_positions("starting_positions.txt")).to eql positions
    end
  end

  describe "#setup_board" do
    it "takes an Array of Array, translates the acronyms to Pieces and returns a Hash" do
      transformed_input = board.setup_board(positions)
      default_hash = Board.new.setup_board_default

      transformed_input.each do |pos, piece|
        expect(piece.class).to eql default_hash[pos].class
        expect(piece.color).to eql default_hash[pos].color
      end
    end
  end
end
