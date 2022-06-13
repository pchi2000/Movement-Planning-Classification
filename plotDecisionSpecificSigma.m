function [] = plotDecisionSpecificSigma(mu1, mu2, mu3, sigma1, sigma2, sigma3)
X1 = linspace(0,20,200);
X2 = linspace(0,20,200);
count = 0;
for i = 1:length(X2)
    for j = 1:length(X1)
        vx = [X1(i); X2(j)];
        c1 = log(1/3)-log(2*pi)-((1/2)*log(det(sigma1)))-((1/2)*(vx-mu1)'*inv(sigma1)*(vx-mu1));
        c2 = log(1/3)-log(2*pi)-((1/2)*log(det(sigma2)))-((1/2)*(vx-mu2)'*inv(sigma2)*(vx-mu2));
        c3 = log(1/3)-log(2*pi)-((1/2)*log(det(sigma3)))-((1/2)*(vx-mu3)'*inv(sigma3)*(vx-mu3));
        k = max([c1, c2, c3]);

        if c3 >= c1; count = count + 1;
        elseif c3 >= c2; count = count + 1;
        end
        if k == c1; marker = '.r';
        elseif k == c2; marker = '.g';
        elseif k == c3; marker = '.b';
        end
        plot(X1(i),X2(j),marker, 'MarkerSize', 1);
    end
end
end
