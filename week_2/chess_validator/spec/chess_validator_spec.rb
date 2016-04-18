describe ChessValidator do
  before do
    @validator = ChessValidator.new
  end

  describe ".new" do
    it "instantiates a ChessValidator object" do
      expect(@validator.class).to eql ChessValidator
    end
  end

  describe "#load_moves" do
    it "returns an Array of Arrays" do
      moves = @validator.load_moves("simple_moves.txt")

      # usually we write only one expectation per test case
      # but when doing potentially expensive / slow operations
      # like reading a file and instantiating many objects
      # it can be a better alternative to have only one test case
      # with multiple expectations
      expect(moves.class).to eql Array
      expect(moves.count).to eql 12
      expect(moves[0]).to eql ["a2", "a3"]
    end

    # write test stubs by using "pending" instead of "if"
    context "when the file does not exist" do
      pending "exits with an error message"
    end
  end

  # test_move has been refactored to only add
  # a bit of output depending on the result
  # of legal_move? So we write not many tests for it.
  describe "#test_move" do
    context "legal move" do
      it "writes LEGAL to STDOUT" do
        expect(STDOUT).to receive(:puts).with("LEGAL")

        @validator.test_move("a2", "a3")
      end
    end

    context "illegal move" do
      it "writes ILLEGAL to STDOUT" do
        expect(STDOUT).to receive(:puts).with("ILLEGAL")

        @validator.test_move("a2", "b5")
      end
    end
  end

  # write one-line test cases if you have simple tests
  # and a lot of repitition
  describe "#legal_move?" do
    context "simple" do
      context "legal moves" do
        it { expect(@validator.legal_move?("a2", "a3")).to be true }
        it { expect(@validator.legal_move?("a2", "a4")).to be true }
        it { expect(@validator.legal_move?("a7", "a6")).to be true }
        it { expect(@validator.legal_move?("a7", "a5")).to be true }
        it { expect(@validator.legal_move?("b8", "a6")).to be true }
        it { expect(@validator.legal_move?("b8", "c6")).to be true }
        it { expect(@validator.legal_move?("e2", "e3")).to be true }
      end

      context "illegal moves" do
        it { expect(@validator.legal_move?("a2", "a5")).to be false }
        it { expect(@validator.legal_move?("a7", "a4")).to be false }
        it { expect(@validator.legal_move?("a7", "b6")).to be false }
        it { expect(@validator.legal_move?("b8", "d7")).to be false }
        it { expect(@validator.legal_move?("e3", "e2")).to be false }
      end
    end

    # skip a whole context of tests and give a reason why
    context "complex", skip: "loading of starting positions not implemented" do
      context "legal moves" do
        it { expect(@validator.legal_move?("a2", "a3")).to be true }
      end

      context "illegal moves" do
        it { expect(@validator.legal_move?("a1", "g8")).to be true }
      end
    end
  end
end
