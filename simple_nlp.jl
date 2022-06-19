using CasADi

x = SX("x",2);
f = x[1]^2 + x[2]^2;
g = x[1]+x[2]-10;
nlp = Dict("x"=>x, "f"=>f, "g"=>g);

S = casadi.nlpsol("S","ipopt",nlp);

sol = S(lbg=0);

println("Optimal solution: x = ", sol["x"].toarray()[1], ", y = ", sol["x"].toarray()[2])
