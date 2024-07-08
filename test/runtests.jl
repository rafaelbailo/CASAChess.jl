using CASAChess

using SafeTestsets, Test

@testset "CASAChess.jl" begin
  for test ∈ ["aqua", "FEN", "format"]
    @eval begin
      @safetestset $test begin
        include($test * ".jl")
      end
    end
  end
end
