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

  pieces = parts[1]
  rows = split(pieces, "/")
  if length(rows) != 8
    @warn "Invalid FEN string: it should contain the position of pieces on all eight rows of the board, separated by the character `/`."
    return false
  end

  for (k, row) ∈ enumerate(rows)
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
