RSpec.describe Move do
  describe ".new" do
    context "two valid positions" do
      context "given a1, h8" do
        it "instantiates a Move object" do
          move = Move.new("a1", "h8")
          expect(move.class).to eql Move
        end
      end
    end

    context "invalid arguments" do
      context "given only one position" do
        it "raises an ArgumentError" do
          expect { Move.new("a1") }.to raise_error ArgumentError, "wrong number of arguments (given 1, expected 2)"
        end
      end

      context "given two positions, at least one of bounds" do
        it "raises NotValidPositonError for x1" do
          expect { Move.new("a1", "x1") }.to raise_error NotValidPositonError, "For: x1"
        end

        it "raises NotValidPositonError for y1" do
          expect { Move.new("y1", "z1") }.to raise_error NotValidPositonError, "For: y1"
        end

        it "raises NotValidPositonError for z1" do
          expect { Move.new("z1", "a1") }.to raise_error NotValidPositonError, "For: z1"
        end

        it "raises NotValidPositonError for b9" do
          expect { Move.new("a1", "b9") }.to raise_error NotValidPositonError, "For: b9"
        end

        it "raises NotValidPositonError for c9" do
          expect { Move.new("c9", "a10") }.to raise_error NotValidPositonError, "For: c9"
        end

        it "raises NotValidPositonError for d9" do
          expect { Move.new("d9", "a1") }.to raise_error NotValidPositonError, "For: d9"
        end
      end

      context "given arguments that are not positions" do
        it "raises NotValidPositonError" do
          expect { Move.new("a1", "hello") }.to raise_error NotValidPositonError
        end

        it "raises NotValidPositonError" do
          expect { Move.new("a1", []) }.to raise_error NotValidPositonError
        end

        it "raises NotValidPositonError" do
          expect { Move.new("a1", :b9) }.to raise_error NotValidPositonError
        end
      end
    end
  end

  describe "#no_move?" do
    context "the same positions" do
      it "returns true" do
        expect(Move.new("a2", "a2").no_move?).to be true
      end
    end

    context "different positions" do
      it "returns false" do
        expect(Move.new("a2", "a3").no_move?).to be false
      end
    end
  end

  describe "#vertical?" do
    context "the same column" do
      it "returns true" do
        expect(Move.new("a2", "a4").vertical?).to be true
      end
    end

    context "different columns" do
      it "returns false" do
        expect(Move.new("a2", "b2").vertical?).to be false
      end
    end
  end

  describe "#horizontal?" do
    context "the same row" do
      it "returns true" do
        expect(Move.new("a2", "c2").horizontal?).to be true
      end
    end

    context "different rows" do
      it "returns false" do
        expect(Move.new("a2", "a4").horizontal?).to be false
      end
    end
  end

  describe "#diagonal?" do
    context "equal movement by columns and rows" do
      it "returns true" do
        expect(Move.new("a1", "h8").diagonal?).to be true
      end
    end

    context "unequal movement by columns and rows" do
      it "returns false" do
        expect(Move.new("a2", "a4").diagonal?).to be false
      end

      it "returns false" do
        expect(Move.new("a2", "c2").diagonal?).to be false
      end

      it "returns false" do
        expect(Move.new("a2", "c5").diagonal?).to be false
      end
    end
  end

  describe "#arbitrary?" do
    context "unequal movement by columns and rows" do
      it "returns true" do
        expect(Move.new("a1", "c2").arbitrary?).to be true
      end
    end

    context "equal movement by columns and / or rows" do
      it "returns false" do
        expect(Move.new("a2", "a4").arbitrary?).to be false
      end

      it "returns false" do
        expect(Move.new("a2", "c2").arbitrary?).to be false
      end

      it "returns false" do
        expect(Move.new("a2", "c4").arbitrary?).to be false
      end
    end
  end

  describe "#column_steps" do
    it "returns 0" do
      expect(Move.new("a1", "a1").column_steps).to eql 0
    end

    it "returns -1" do
      expect(Move.new("a1", "b1").column_steps).to eql(-1)
    end

    it "returns -7" do
      expect(Move.new("a1", "h1").column_steps).to eql(-7)
    end

    it "returns 3" do
      expect(Move.new("d4", "a4").column_steps).to eql 3
    end
  end

  describe "#row_steps" do
    it "returns 0" do
      expect(Move.new("a1", "a1").row_steps).to eql 0
    end

    it "returns -1" do
      expect(Move.new("a1", "a2").row_steps).to eql(-1)
    end

    it "returns -7" do
      expect(Move.new("a1", "h8").row_steps).to eql(-7)
    end

    it "returns 3" do
      expect(Move.new("d4", "d1").row_steps).to eql 3
    end
  end

  # do NOT write tests for private methods
end
