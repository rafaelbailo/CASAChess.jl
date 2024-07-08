const VALID_SYMBOLS = [:Z, :z, :K, :Q, :R, :B, :N, :P, :k, :q, :r, :b, :n, :p]
# const VALID_STRINGS =
#   ["K", "Q", "R", "B", "N", "P", "k", "q", "r", "b", "n", "p"]
const VALID_CHARS = ['K', 'Q', 'R', 'B', 'N', 'P', 'k', 'q', 'r', 'b', 'n', 'p']

const SYMBOL_2_UNICODE = Dict(
  :Z => " ",
  :z => " ",
  :K => "♔",
  :Q => "♕",
  :R => "♖",
  :B => "♗",
  :N => "♘",
  :P => "♙",
  :k => "♚",
  :q => "♛",
  :r => "♜",
  :b => "♝",
  :n => "♞",
  :p => "♟︎",
)
