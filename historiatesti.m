%This function is used to optimize the density matrix.
%The optimization method that is used is "fmincon" which requires
%Optimization Toolbox.

function [x, fval, history] = historiatesti(x0)
%Defining some used things.
    history = {};
    clear norm
    px = [0,1;1,0];
    pz = [1,0;0,-1];
    pzz = kron(pz,pz);
    py = [0,-i;i,0];
    I = eye(2);
%Below is the function with variables that are being optimized. In this
%case the vector "x" contains the expectation values of Pauli
%measurements, that are needed to obtain the density matrix.
    f = @(x) trace(sqrtm(1/2 * (I + x(1)*px + x(2)*py + x(3)*pz)'*...
        (1/2 * (I + x(1)*px + x(2)*py + x(3)*pz))));
%Next up there is the parameters that the "fmincon" could use.
    x0 = [0,0,0];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [];
    ub = [];
%"nonlincon" is the main constraint here. It allows multiple non linear
%constraints to be used. "options" is used to obtain certain values
%without need of any loops.
    nonlincon = @nlcon;
    options = optimset('OutputFcn', @myoutput);
    
%This "fmincon" returns the values of "x".
    [x, [], exitflag, output] = fmincon(f, x0, A, b, Aeq, beq, lb, ub, nonlincon, options);
    disp(x);
    rho = 1/2 * (I + x(1)*px + x(2)*py + x(3)*pz);
    disp(1/2 * (I + x(1)*px + x(2)*py + x(3)*pz));
    disp(output);
    %rhovalues{k} = rho;
    %xvalues{k} = x;

%This function controls and saves the values of each iteration step.
    function stop = myoutput(x, optimvalues, state);
        stop = false;
        if isequal(state,'iter')
            history = [history, 1/2 * (I + x(1)*px + x(2)*py + x(3)*pz)];
        end
    end
rho = 1/2 * (I + x(1)*px + x(2)*py + x(3)*pz);
end