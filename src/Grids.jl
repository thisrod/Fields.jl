"""
Rectangular domains with given step sizes and zero boundary conditions.
In the future, the boundary conditions will be configurable.
"""
module Grids

export Grid

struct Grid
    steps::Vector{Float64}
    sizes::Vector{Int}
    Grid(h,nx,l,ny) = new([h, l], [nx, ny])
end

end # module