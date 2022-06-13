function [mu] = getMu(trial, k)
[X1, X2] = getValues(trial, k);
mu = [sum(X1)/20; sum(X2)/20];
end
