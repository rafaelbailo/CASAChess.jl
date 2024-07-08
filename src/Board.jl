mutable struct Board
  board::Vector{Piece}

  function Board(pieces::Vector{<:Piece})
    board::Vector{Piece} = [NO_PIECE for k ∈ 1:64]
    for piece ∈ pieces
      board[piece.position] = piece
    end
    return new(board)
  end
end

function Base.show(io::IO, board::Board)
  println(io)
  println(io)

  print(io, "     ")
  for i ∈ 1:8
    print(io, "   $(Char(i + 64))  ")
  end
  println(io)
  println(io)

  for j ∈ 1:8
    print(io, "     ")
    for i ∈ 1:8
      if ((i + j) % 2) == 0
        print(io, " ╔═══╗")
      else
        print(io, " ┏━━━┓")
      end
    end
    println(io)

    print(io, "  $(9 - j)  ")
    for i ∈ 1:8
      if ((i + j) % 2) == 0
        print(io, " ║ ")
      else
        print(io, " ┃ ")
      end
      print(io, get_symbol(board.board[i + 8 * (j - 1)]))
      if ((i + j) % 2) == 0
        print(io, " ║")
      else
        print(io, " ┃")
      end
    end
    print(io, "   $(9 - j)")
    println(io)

    print(io, "     ")
    for i ∈ 1:8
      if ((i + j) % 2) == 0
        print(io, " ╚═══╝")
      else
        print(io, " ┗━━━┛")
      end
    end
    println(io)
  end

  println(io)
  print(io, "     ")
  for i ∈ 1:8
    print(io, "   $(Char(i + 64))  ")
  end
  println(io)
  return nothing
end
