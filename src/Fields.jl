module Fields

export Grid, Field, domain, coordinates, (..), ×

using LinearAlgebra
using DomainSets: ProductDomain, (..), ×
import Base.fill, Base.size

"""
Rectangular domains with given step sizes and zero boundary conditions.
In the future, the boundary conditions will be configurable.

The boundary points of the grid are on the edges of the domain.  For circular boundary conditions, there will be a half step margin.

Grid(domain, h, l) has enough points that the steps are no greater than h and l.
"""
struct Grid
    domain::ProductDomain
    # If sizes were an array, it would be mutable, and == would need
    # to be overriden.
    size::Tuple{Int,Int}
end

# Constructors for Grid
# Plots exports grid, so Fields sticks to Grid

function Grid(d::ProductDomain, h::Real, l::Real)
    steps = collect(c.right-c.left for c in d.domains) ./ [h, l]
    Grid(d, Tuple(ceil.(Int, steps) .+ 1))
end

Grid(d::ProductDomain, h::Real) = Grid(d, h, h)

"""
Samples for a function on a grid.
"""
struct Field{T<:Number} <: AbstractMatrix{T}
    domain::ProductDomain
    values::Matrix{T}
end

# Make this compatible with ApproxFun

size(g::Grid) = g.size
domain(g::Grid) = g.domain
size(u::Field) = size(u.values)
domain(u::Field) = u.domain
Grid(u::Field) = Grid(domain(u), size(u))

# Constructing fields

Base.fill(x, g::Grid) = Field(domain(g), fill(x, size(g)))

# coordinates


end # module
