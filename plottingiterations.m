for k = 1:14
    subtractions(k) = norm(rhovalues{k}-rhovalues{k+1});
    clear norm
    values(k) = norm(rhovalues{k});
    clear norm
    difference(k) = norm(den-rhovalues{k});
    clear norm
end
subtractions;
iterations = [1:1:14];

figure(1);
hold on
plot(iterations, subtractions(1:14), 'ko', 'markersize', 10);
xlabel('Iteration steps')
ylabel('Difference between iterated matrices by norm')
plot(iterations, subtractions(1:14), 'r--');
hold off

figure(2);
hold on
plot(iterations, values, 'ko', 'markersize', 10);
xlabel('Iteration steps')
ylabel('Norm value of iterated density matrix')
plot(iterations, values, 'r--');
hold off

figure(3);
hold on
plot(iterations, difference, 'ko', 'markersize', 10);
xlabel('Iteration steps')
ylabel('Difference between used density matrix and iterated one')
plot(iterations, difference, 'r--');
hold off
