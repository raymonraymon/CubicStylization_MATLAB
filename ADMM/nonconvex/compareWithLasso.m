err1 = [];
card1 = [];
for K = 1:5:2*p*n
    [x, history] = regressor_sel(A, b, K, 1.0);
    err1 = [err1 norm(A*x - b)];
    card1 = [card1 K];
end

% lambda max
lambda_max = norm( A'*b, 'inf' );

err2 = [];
card2 = [];
for lambda = (1:-.01:.02)*lambda_max
    [x, history] = lasso(A, b, lambda, 1.0, 1);
    err2 = [err2 norm(A*x - b)];
    card2 = [card2 sum(x~=0)];
end

p = figure
stairs(card1, err1, 'k', 'LineWidth', 2);
hold on;
stairs(card2, err2, 'k--', 'LineWidth', 2);
ylabel('||Ax-b||'); xlabel('card(x)');
legend('regressor selection', 'l1 regularization');