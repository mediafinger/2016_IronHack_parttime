module BoardFromFile
  LETTERS_TO_PIECES_MAP = {
    "R" => "Rook",
    "N" => "Knight",
    "B" => "Bishop",
    "Q" => "Queen",
    "K" => "King",
    "P" => "Pawn",
  }
  COLORS_MAP = {
    "b" => :black,
    "w" => :white,
  }

  def load_positions(filename)
    positions = []

    File.open(filename, "r").each_line.with_index do |line, row|
      positions << []
      line.split(" ").each_with_index do |piece, column|
        positions[row][column] = piece
      end
    end

    positions
  end

  def setup_board(positions)
    board = {}

    positions.each_with_index do |row, y|
      row.each_with_index do |acronym, x|
        position = indexes_to_chess_notation(x, y)
        klass = acronym_to_piece_class(acronym)
        color = acronym_to_color(acronym)

        board[position] = klass.new(color, position, board) unless klass.nil?
      end
    end

    board
  end

  # converts 0, 0 to "a1" ... 7, 7 to "h8"
  def indexes_to_chess_notation(column, row)
    "#{(column.ord + 97).chr}#{row + 1}"
  end

  def acronym_to_piece_class(acronym)
    letter = acronym[1]
    class_name = LETTERS_TO_PIECES_MAP[letter]
    Object.const_get(class_name) if class_name
  end

  def acronym_to_color(acronym)
    letter = acronym[0]
    COLORS_MAP[letter]
  end
end
