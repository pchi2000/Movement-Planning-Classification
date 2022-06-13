load('ps3_simdata.mat')
figure
xlabel('X1 (Neuron 1)')
ylabel('X2 (Neuron 2)')
title('Gaussian (shared covariance)')
hold on
%% a
for k = 1:3
[X1, X2] = getValues(trial, k);
if k == 1; marker = 'rx';
elseif k == 2; marker = 'g+';
else; marker = 'bo';
end
plot(X1, X2, marker, 'LineWidth', 1.5)
end
axis([0 20 0 20])

%% b & c
pi = 20/60; %Nk/N

[mu1] = getMu(trial, 1);
plot(mu1(1), mu1(2), 'r.', 'MarkerSize', 20)
[mu2] = getMu(trial, 2);
plot(mu2(1), mu2(2), 'g.', 'MarkerSize', 20)
[mu3] = getMu(trial, 3);
plot(mu3(1), mu3(2), 'b.', 'MarkerSize', 20)

sigma = zeros(2, 2);
for k = 1:3
    [mu] = getMu(trial, k);
    S = zeros(2, 2);
    for n = 1:20
        x = trial(n, k).x;
        s_x = ((x - mu) * (x - mu)');
        S = S + s_x;
    end
    S = S / 20;
    sigma = sigma + (pi * S);
end 

sigma = zeros(2, 2);
for k = 1:3
    S = getSigma(trial, k);
    sigma = (S*pi) + sigma;
end 

%% d
x1 = linspace(0,20);
x2 = linspace(0,20);
[X1,X2] = meshgrid(x1(:),x2(:));
X = [X1(:) X2(:)];
Z = mvnpdf(X, mu1', sigma);
Z = reshape(Z,[100 100]);
contour(X1, X2, Z, [0.007, 0.007], 'r');
Z = mvnpdf(X, mu2', sigma);
Z = reshape(Z,[100 100]);
contour(X1, X2, Z, [0.007, 0.007], 'g');
Z = mvnpdf(X, mu3', sigma);
Z = reshape(Z,[100 100]);
contour(X1, X2, Z, [0.007, 0.007], 'b');
%% e
plotDecisionSharedSigma(mu1, mu2, mu3, sigma);
