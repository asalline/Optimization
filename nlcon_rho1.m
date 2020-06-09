%This function contains all the non linear constraints that are used to
%optimize with "fmincon_rho".

function [c, ceq] = nlcon1(x)
%Defining used things. "original_rho" is global object that comes from
%random density matrix generator.
global original_rho
px = [0,1;1,0];
pz = [1,0;0,-1];
py = [0,-i;i,0];
meanx = trace(px*original_rho);
meany = trace(py*original_rho);
meanz = trace(pz*original_rho);
error = ((0.0001*rand)+(0.0001*rand)+(0.0001*rand))/3;
c1 = 0;
ceq1 = abs(x(1) - meanx);
c2 = 0;
ceq2 = abs(x(2) - meany);
c3 = 0;
ceq3 = abs(x(3) - meanz);
c = [c1;c2;c3];
ceq = [ceq1;ceq2;ceq3];

%For the complex valued density matrices "ceq2" needs to be know, since it
%holds the information about imaginary parts.
%In fact for one qubit density matrix one needs all the measurements to
%minimize the vector x and thus obtaining the density matrix.