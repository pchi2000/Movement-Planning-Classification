load('ps3_simdata.mat')
figure
xlabel('X1 (Neuron 1)')
ylabel('X2 (Neuron 2)')
title('Gaussian (class-specific covariance)')
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

[sigma1] = getSigma(trial, 1);
[sigma2] = getSigma(trial, 2);
[sigma3] = getSigma(trial, 3);

%% d
X1 = linspace(0,20);
X2 = linspace(0,20);
[X,Y] = meshgrid(X1(:),X2(:));
nX = [X(:) Y(:)];
Z = mvnpdf(nX, mu1', sigma1);
Z = reshape(Z,[100 100]);
contour(X, Y, Z, [0.007, 0.007], 'r');
Z = mvnpdf(nX, mu2', sigma2);
Z = reshape(Z,[100 100]);
contour(X, Y, Z, [0.007, 0.007], 'g');
Z = mvnpdf(nX, mu3', sigma3);
Z = reshape(Z,[100 100]);
contour(X, Y, Z, [0.007, 0.007], 'b');

%% e
plotDecisionSpecificSigma(mu1, mu2, mu3, sigma1, sigma2, sigma3);
