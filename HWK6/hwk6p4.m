function [a,b] = hwk6p4(a0,b0)
    %clear all
    %% get data
    run('hwk6p4data.m');
    %clear all
    % a0 = 5;
    % b0 = 5;
    [m,n] = size(X);
    y = zeros(m,1);
    y(1:q) = 1; %% the y produced by 'hwk6p4data.m' is not what I wanted
    %% initialize

    z = [a0,b0]';
    Lambda_sqrt = 200;
    n_iter = 1;
    %% setting
    e = eps;
    max_iter = 100;
    %mylg = zeros(1, max_iter)
    %g = [10000,10000]'; %% only for plotting
    while Lambda_sqrt/2 > e  
        if n_iter > max_iter
            break
        end
        n_iter = n_iter + 1;
        %% compute gradient g and hessian H
        [g,H] = compute_gH(X,y,z);
        %mylg(n_iter) = lg
        %% compute direction h, and Newton Decrement Lambda
        invH = inv(H);
        h = -invH * g;
        Lambda_sqrt = g' * invH * g;
        %% backtrack
        t = mybacktrack(X,y,z,h,g);
        %% update z
        z = z + t*h;
    end
    a = z(1:end-1);
    b = z(end);
end
%print(z)
    
    
    
    
    
    
    