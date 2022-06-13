function [sigma] = getSigma(trial, k)
[mu] = getMu(trial, k);
sigma = zeros(2, 2);
for n = 1:20
    x = trial(n, k).x;
    s_x = ((x - mu) * (x - mu)');
    sigma = sigma + s_x;
end
sigma = sigma / 20;
end
