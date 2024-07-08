const STARTING_FEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

function parse_FEN_string(s::String)
  @assert is_valid_FEN(s)

  pieces = Vector{Piece}(undef, 0)

  board_index = 1

  board = first(split(s))
  rows = split(board, "/")
  row = first(rows)

  for row ∈ rows
    for char ∈ row
      if isnumeric(char)
        board_index += parse(Int, char)
      else
        @assert char in VALID_CHARS
        piece = Piece(char)
        set_position(piece, board_index)
        push!(pieces, piece)
        board_index += 1
      end
    end
  end
  @assert board_index == 65

  board = Board(pieces)
  return board
end
export parse_FEN_string

function count_pieces_FEN(s::String)
  board = first(split(s))
  count = mapreduce(isletter, +, board)
  return count
end

function is_valid_FEN(s::String)
  if count(x -> x == ' ', s) != 5
    @warn "Invalid FEN string: it should contain precisely 5 whitespaces."
    return false
  end

  parts = split(s)
  if length(parts) != 6
    @warn "Invalid FEN string: it should contain precisely 6 blocks of information, separated by whitespaces."
    return false
  end

  board = parts[1]
  rows = split(board, "/")
  if length(rows) != 8
    @warn "Invalid FEN string: it should contain the position of pieces on all eight rows of the board, separated by the character `/`."
    return false
  end

  for (k, row) ∈ enumerate(rows)
    for char ∈ row
      if !isnumeric(char)
        if !(char in VALID_CHARS)
          @warn "Invalid FEN string: char $char in row number $k (\"$row\") is not valid."
          return false
        end
      end
    end

    if !is_valid_FEN_count_squares(row)
      @warn "Invalid FEN string: row number $k (\"$row\") does not have 8 squares."
      return false
    end
  end

  return true
end

function is_valid_FEN_count_squares(s)
  return mapreduce(
    x -> parse(Int, string(x)),
    +,
    collect(replace(s, r"[PpRrNnBbQqKk]" => 1)),
  ) == 8
end
