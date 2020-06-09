%This function triggers the solver and then calculates and plots the
%fidelity (closeness of two quantum states) with every iteration step.

x0 = zeros(1,15);
[x, fval, history] = fmincon_rho2(x0);

global original_rho
for k = 1:length(history)
    fidelity(k) = (trace(sqrtm(sqrtm(history{k})*original_rho*sqrtm(history{k}))))^2;
end
steps = [1:1:length(fidelity)];

figure(1);
hold on
plot(steps, fidelity, 'ko', 'markersize', 10);
xlabel('Iteration steps');
ylabel('Fidelity');
plot(steps, fidelity, 'r--');
hold off

rho = history{end};
disp('Optimized density matrix')
disp(rho)
disp('Original density matrix')
disp(original_rho)