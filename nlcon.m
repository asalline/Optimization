function [c, ceq] = nlcon(x)
error = 0.005;
px = [0,1;1,0];
pz = [1,0;0,-1];
py = [0,-i;i,0];
%evalx = trace(px*rho1);
%evaly = trace(py*rho1);
%evalz = trace(pz*rho1);
c1 = 0;
ceq1 = abs(x(1) - 0.467382549935270+error);
c2 = 0;
ceq2 = abs(x(2) - -0.883310492492032+error);
c3 = 0;
ceq3 = abs(x(3) - -0.036278449105357+error);
c = [c1;c2;c3];
ceq = [ceq1;ceq2;ceq3];

%For the complex valued density matrices "ceq2" needs to be know, since it
%holds the information about imaginary parts.
%In fact for one qubit density matrix one needs all the measurements to
%minimize the vector x and thus obtaining the density matrix.