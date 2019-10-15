function [A,b,x] = generate_data(n,p)
    %% assume p > n (p = 4n in problem)
    %% xtrue should be very sparse, only 1% ~ 5% nonzeros
    %% maybe need to shuffle A, x
    ptrue = round(0.02*p);
    Atrue = randn(n,ptrue);     
    %xtrue = 10*randn(ptrue,1);
    xtrue = randn(ptrue,1);
    b = Atrue * xtrue + 0.1*randn(n,1);
    
    %% expand to get larger A and x
    A = horzcat(Atrue, randn(n, p - ptrue));
    x = vertcat(xtrue, zeros(p-ptrue, 1));
    
    %% shuffle both x and A
    idx = randperm(p);
    A = A(:,idx);
    x = x(idx);
end