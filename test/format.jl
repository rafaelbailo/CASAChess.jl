using CASAChess, JuliaFormatter, Test

function tests()
  f(s) = format(s; CASAChess.FORMAT_SETTINGS...)
  f("..")
  @test f("..")
end

tests()
