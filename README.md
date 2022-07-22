# JuDOBase

## Getting Started

```julia
#Creating DOP
dop = DOProblem(t0 = 0.0, tf = 2.0);

#Adding a time node
@timeNode(dop, t1 ~ 1.0);

#Adding static variables
@staticVariable(dop, p);
@bound(dop, -3.0 <= p <= 3.0);
@guess(dop, p ~ 1.0);

#Adding dynamic variables
@dynamicVariable(dop, x);
@bound(dop, -4.0 <= x <= 4.0);
@bound(dop, x(t0) ~ 3.0);

@dynamicVariable(dop, u; forceContinuity=true);
@bound(dop, -1.0 <= u(t1) <= 1.0);

#Setting equations
@equations(dop, [
    Dot(x) ~ u
]);
```

## Constrained Block-move example

```julia
dop = DOProblem(t0 = 0.0, tf = 1.0);

@dynamicVariable(dop, x);
@bound(dop, x(t0) ~ 0.0);
@bound(dop, x(tf) ~ 1.0);

@dynamicVariable(dop, v);
@bound(dop, v(t0) ~ 0.0);
@bound(dop, v(tf) ~ 0.0);

@dynamicVariable(dop, u);
@bound(dop, -4.0 <= u <= 4.0));

@equations(dop, [
    Dot(x) ~ v,
    Dot(v) ~ u
]);

solution = solve(dop, Interesso.LeastSquares());
```