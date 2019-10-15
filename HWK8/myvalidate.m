function [x] = myvalidate()
    %% input
    n = 100;
    m = 30;
    p = 30;

    %% generate data
    randn('state',0);
    rand('state',0);
    A = rand(m,n);
    C = rand(p,n);
    v = rand(p,1);
    xhat = rand(n,1);
    b = A * xhat;
    d = C * xhat + v;

    %% cvx
    cvx_begin quiet
        variables x(n);
        minimize( -sum(entr( x ) ));
        subject to 
            A*x == b;
            C*x - d <= 0;
    cvx_end
end