# Steady-state of Distillation Column A optimization
# Translated from MATLAB https://github.com/detu/licq-path-following/blob/master/models/disColA/distACstrSS.m

using CasADi

# parameter values
NT = 41;        # number of trays
LT = 2.827;     # reflux
VB = 3.454;     # boilup
F  = 1.0;       # feedrate
zF = 1.0;       # feed composition at CSTR
D  = 0.5;       # distilation flow
B  = 0.5;       # bottoms flow
qF = 1.0;       # feed liquid fraction

# create dictionary for distillation 
dist["F_0"] = 1;
dist["NT"]  = NT;
dist["zF"]  = zF;
dist["qF"]  = qF;

# price setting
price["pf"] = 1;
price["pV"] = 0.02;
price["pB"] = 2;
price["pD"] = 0;

# symbolic primitives
for i in 1:2*NT+2 
    x[i] = SX("x_" * String(i));
    l[i] = SX("l_" * String(i));
end
u1 = SX("u1");  # LT
u2 = SX("u2");  # VB
u3 = SX("u3");  # F
u4 = SX("u4");  # D
u5 = SX("u5");  # B

# concatenate states and controls
x = vcat(x[:]);
x = vcat(x;u1;u2;u3;u4;u5);

# decision variables as equality constraints and additional inequality
Xinit = 0.5*ones(2*NT+2);
Uinit = [Xinit;LT;VB;F;D;B];

# define the dynamics as equality constraints and additional inequality
# constraints (lbx, ubx, lbg, and ubg)

obj, eq, lbx , ubx, lbg, ubg = buildModelEq(x, dist, price);




function buildModelEq(u,dist,price)
    NT = dist["NT"];
    NF = 21;         # location of feed stage (stages are counted from the bottom) 
    α  = 1.5;        # relative volatility
    μw = 0.5;        # nominal liquid holdups
    # data for 
end
