function [X1, X2] = getValues(trial, k)
X1 = zeros(20, 1);
X2 = zeros(20, 1);
for n = 1:20
    X1(n) = trial(n, k).x(1);
    X2(n) = trial(n, k).x(2);
end
end

