# translate code from https://github.com/casadi/casadi/blob/master/docs/examples/python/direct_collocation.py
# to julia

using CasADi

# Degree of interpolating polynomial
d = 3;

# Get collocation points
tau_root = [0 casadi.collocation_points(d,'radau')];
