push!(LOAD_PATH, "../src")

using Test
using Grids

@testset "Grid construction" begin
    g = Grid(0.1,10,0.3,10)
end