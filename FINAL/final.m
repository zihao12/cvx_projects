%% implement lasso regression using admm
%% min 1/2 |Ax-b|^2 + lambda |x|_1
function [hatx,x] = final(n)
    randn('state',0);
    rand('state',0);

    %% generate data
    p = n*4;
    [A,b, x] = generate_data(n,p);
    
    %% fit data
    lam = 10;
    rho = 2;
    [hatx,z,u] = myadmm(A,b,lam,rho);
end




 
 
