% randn('state',0);
% rand('state',0);
% 
% %% generate data
% n = 100;
% p = n*4;
% [A,b, xtrue] = generate_data(n,p);

function [x,z] = myvalidation(A,b,lam, rho)
    %% lasso regression
    [n,p] = size(A);
    cvx_begin quiet
        variables x(p) z(p);
        minimize(0.5* power(2,norm(A*x-b,2)) + lam*norm(x,1));

        subject to 
            x - z == 0;
    cvx_end
end