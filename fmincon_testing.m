clear norm
px = [0,1;1,0];
pz = [1,0;0,-1];
pzz = kron(pz,pz);
py = [0,-i;i,0];
I = eye(2);

%x denotes the expectation values of operators, the measurement values.

f = @(x) norm(1/2 * (I + x(1)*px + x(2)*py + x(3)*pz));
x0 = [0,0,0];
A = [];
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
nonlincon = @nlcon;

for k = 1:20
options = optimset('MaxIter', k);

[x, fval, exitflag, output] = fmincon(f, x0, A, b, Aeq, beq, lb, ub, nonlincon, options);
disp(x);
rho = 1/2 * (I + x(1)*px + x(2)*py + x(3)*pz);
disp(1/2 * (I + x(1)*px + x(2)*py + x(3)*pz));
disp(output);
rhovalues{k} = rho;
xvalues{k} = x;
end