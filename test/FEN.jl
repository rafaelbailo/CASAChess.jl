using CASAChess, Suppressor, Test

function tests()
  @testset "is_valid_FEN" begin
    @suppress begin
      good = "8/5k2/3p4/1p1Pp2p/pP2Pp1P/P4P1K/8/8 b - - 99 50"
      @test CASAChess.is_valid_FEN(good)

      missing_space = "8/5k2/3p4/1p1Pp2p/pP2Pp1P/P4P1K/8/8 b - - 9950"
      @test !CASAChess.is_valid_FEN(missing_space)

      missing_part = "8/5k2/3p4/1p1Pp2p/pP2Pp1P/P4P1K/8/8  - - 99 50"
      @test !CASAChess.is_valid_FEN(missing_part)

      missing_row = "8/3p4/1p1Pp2p/pP2Pp1P/P4P1K/8/8 b - - 99 50"
      @test !CASAChess.is_valid_FEN(missing_row)

      invalid_char = "8/5w2/3p4/1p1Pp2p/pP2Pp1P/P4P1K/8/8 b - - 99 50"
      @test !CASAChess.is_valid_FEN(invalid_char)

      missing_square = "8/4k2/3p4/1p1Pp2p/pP2Pp1P/P4P1K/8/8 b - - 99 50"
      @test !CASAChess.is_valid_FEN(missing_square)
    end
  end

  return nothing
end

tests()
