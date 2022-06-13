load('ps3_simdata.mat')
figure
xlabel('X1 (Neuron 1)')
ylabel('X2 (Neuron 2)')
title('Poisson')
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

[X1, X2] = getValues(trial, 1);
L11 = sum(X1) / 20;
L12 = sum(X2) / 20;
[X1, X2] = getValues(trial, 2);
L21 = sum(X1) / 20;
L22 = sum(X2) / 20;
[X1, X2] = getValues(trial, 3);
L31 = sum(X1) / 20;
L32 = sum(X2) / 20;
plot(L11, L12, 'r.', 'MarkerSize', 20)
plot(L21, L22, 'g.', 'MarkerSize', 20)
plot(L31, L32, 'b.', 'MarkerSize', 20)

%% e (skip d)
plotDecisionPoisson([L11; L12], [L21; L22], [L31; L32])
