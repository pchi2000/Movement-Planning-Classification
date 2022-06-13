function [] = plotHyperplane(trial, k, j, sigma)
[mu_k] = getMu(trial, k);
w_k = inv(sigma) * mu_k;
w_k0 = (-1/2) * mu_k' * inv(sigma) * mu_k + log(pi);
[mu_j] = getMu(trial, j);
w_j = inv(sigma) * mu_j;
w_j0 = (-1/2) * mu_j' * inv(sigma) * mu_j + log(pi);
A = (w_k - w_j)';
B = -(w_k0 - w_j0);
x = linspace(0, 20);
y = (B - (A(1) * x)) / A(2);
plot(x, y, 'k');
end
