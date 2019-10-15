%% run it once then again
%xtruth = x1;
%% eps cannot be obtained in tol
%% n_iter1 = 6 while n_iter2 = 115 (it is super sensitive to beta (0.8 way better than 0.5))
%% global variable
n = 100;
p = 30;
e = eps;
%% generate data
randn('state',0);
rand('state',0);
A = rand(p,n);
xhat = rand(n,1);
b = A * xhat;

x0 = xhat;

%x0 = ones(n,1);
%% (a) standard Newton Method
disp("start standard newton");
x = x0;
lambda = ones(p,1);
lam_sq = 1000;
n_iter1 = 0;
mylam = [];
x1s = [norm(x-xtruth)];
while lam_sq/2 > e
    %% compute gradient g, Hessian H 
    g = gradient(x);
    H = Hessian(x);

    n_iter1 = n_iter1 + 1;

    %% compute newton step
    h = zeros(p,1);
    [v,w] = kkt(H,A,g,h);
    dlambda = w - lambda;
    %% compute newton decrement
    lam_sq = -g' * v;
    mylam = [mylam, lam_sq];
    
    %% backtrack
    t = backtrack(x,v,g);
    x = x + t * v;
    x1s = [x1s, norm(x-xtruth)];
    lambda = lambda + t*dlambda;
end
fprintf("standard newton finished after  : %d iterations.\n", n_iter1);
x1 = x;
lambda1 = lambda;
fprintf("objective function  : %12f.\n", obj(x1));

%% (b) infeasible start newton method
disp("start infeasible newton");
x = x0;
lambda = ones(p,1);
r = 1000;
n_iter2 = 0;
myr = [];
x2s = [norm(x-xtruth)];
while r^2/2 > e
    n_iter2 = n_iter2 + 1;
    %% compute gradient g, Hessian H 
    g = gradient(x);
    H = Hessian(x);
    %% compute newton step
    h = A * x - b;
    [v,w] = kkt(H,A,g,h);
    dlambda = w - lambda;
    %% compute r(y)
    r = compute_r_norm(x,lambda,g,A,b);
    myr = [myr, r];
    %% backtrack
    t = backtrack_infeas(v,dlambda,x,lambda,g,A,b);
    x = x + t * v;
    x2s = [x2s, norm(x-xtruth)];
    lambda = lambda + t*dlambda;
end
fprintf("infeasible newton finished after: %d iterations.\n", n_iter2);
x2 = x;
lambda2 = lambda;
fprintf("objective function  : %12f.\n", obj(x2));

fprintf("average difference between x1 and x2: %14f .\n", mean(x1 - x2));
fprintf("average difference between lambda1 and lambda2: %14f .\n", mean(lambda1 - lambda2));

%plot(log(x1s(2:end))./log(x1s(1:end-1)))




