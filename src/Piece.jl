mutable struct Piece{S}
  position::Int
  has_moved::Bool
end
Piece(s::Symbol) = Piece{s}(0, false)
Piece(s::Char) = Piece(Symbol(s))

const NO_PIECE = Piece{:Z}(0, false)

get_symbol(piece::Piece{S}) where {S} = S
# get_symbol(piece::Piece{S}) where {S} = SYMBOL_2_UNICODE[S]

set_position(piece::Piece, k::Int) = piece.position = k

has_moved(piece::Piece) = piece.has_moved

is_white(piece::Piece{:K}) = true
is_white(piece::Piece{:Q}) = true
is_white(piece::Piece{:R}) = true
is_white(piece::Piece{:B}) = true
is_white(piece::Piece{:N}) = true
is_white(piece::Piece{:P}) = true
is_white(piece::Piece{:k}) = false
is_white(piece::Piece{:q}) = false
is_white(piece::Piece{:r}) = false
is_white(piece::Piece{:b}) = false
is_white(piece::Piece{:n}) = false
is_white(piece::Piece{:p}) = false

is_black(piece::Piece) = !is_white(piece)
