# Fields.jl

A `Field` is a two-dimensional `AbstractArray`, which carries a grid and optional boundary condition with it.  It wraps the finite difference derivatives from `DiffEqOperators`, and provides the differentiation and function call syntax from `ApproxFun`.

A `Grid` is an abstraction of the step sizes.  It is compatible with `DomainSets` and so on.

Boundary conditions TBD, as compatible with ApproxFun as possible.

A `Field` should be parametric in its underlying array type, e.g. `CUArray`s

What about grids in the Argand plane?  We'll sometimes want to ask for `Complex` coordinates that are real valued.

## Constructors

```
Grid(D::DomainSet, hs...)
```
A grid for the specified 2D rectangular domain, with steps not exceeding those specified.

```
Grid(D::DomainSet, h)
```
All steps equal.

```
coordinates([T::Type], G::Grid)
```
Returns the x and y coordinates as fields.  (Store values as vectors, and broadcast?)

```
Field{rangetype}
```
This has a boundary condition, which could be `nothing`.

Derivatives for a `Grid` are `DiffEqOperator`s that specifically act on a `Field`, and check that they're compatible with its steps.