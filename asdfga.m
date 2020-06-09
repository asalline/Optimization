x0 = [0,0,0];
[x, fval, history] = historiatesti(x0);

global original_rho
for k = 1:length(history)
    fidelity(k) = (trace(sqrtm(sqrtm(history{k})*original_rho*sqrtm(history{k}))))^2;
end
steps = [1:1:length(fidelity)];

figure(4);
hold on
plot(steps, fidelity, 'ko', 'markersize', 10);
xlabel('Iteration steps');
ylabel('Fidelity');
plot(steps, fidelity, 'r--');
hold off