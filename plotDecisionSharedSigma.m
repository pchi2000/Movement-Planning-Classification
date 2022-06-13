function [] = plotDecisionSharedSigma(mu1, mu2, mu3, sigma)
X1 = linspace(0,20,200);
X2 = linspace(0,20,200);
for i = 1:length(X2)
    for j = 1:length(X1)
        vx = [X1(i); X2(j)];
        c1 = (mu1' * inv(sigma) * vx) - ((1/2) * mu1' * inv(sigma) * mu1) + log(1/3);
        c2 = (mu2' * inv(sigma) * vx) - ((1/2) * mu2' * inv(sigma) * mu2) + log(1/3);
        c3 = (mu3' * inv(sigma) * vx) - ((1/2) * mu3' * inv(sigma) * mu3) + log(1/3);
        disp(c1)
        k = max([c1, c2, c3]);

        if k == c1; marker = '.r';
        elseif k == c2; marker = '.g';
        elseif k == c3; marker = '.b';
        end
        plot(X1(i),X2(j),marker, 'MarkerSize', 1);
    end
end
end
