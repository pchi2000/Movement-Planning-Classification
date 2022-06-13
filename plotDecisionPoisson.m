function [] = plotDecisionPoisson(LM1, LM2, LM3)
X1 = linspace(0,20,200);
X2 = linspace(0,20,200);
for i = 1:length(X2)
    for j = 1:length(X1)
        vx = [X1(i); X2(j)];
        c1 = log(LM1)' * vx - sum(LM1) + log(pi);
        c2 = log(LM2)' * vx - sum(LM2) + log(pi);
        c3 = log(LM3)' * vx - sum(LM3) + log(pi);
        k = max([c1, c2, c3]);
        if k == c1; marker = '.r';
        elseif k == c2; marker = '.g';
        elseif k == c3; marker = '.b';
        end
        plot(X1(i),X2(j),marker, 'MarkerSize', 1);
    end
end
end

