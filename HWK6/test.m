%function [a,b] = hwk6p4(a0,b0)
    %% get data
clear all
run('hwk6p4data.m');
a0 = 5;
b0 = 5;
y = zeros(m,1);
y(1:q) = 1; %% the y produced by 'hwk6p4data.m' is not what I wanted
%% initialize
[m,n] = size(X);
z = [a0,b0]';
Lambda_sqrt = 1000;
n_iter = 1;
%% setting
e = eps;
max_iter = 100;
%mylg = zeros(1, max_iter)
%g = [10000,10000]'; %% only for plotting

myg = zeros(1, max_iter);%% record |gradient| 
myt = zeros(1,max_iter);

while Lambda_sqrt/2 > e  
    if n_iter > max_iter
        break
    end
    n_iter = n_iter + 1;
    %% compute gradient g and hessian H
    [g,H] = compute_gH(X,y,z);
    
    myg(n_iter) = sqrt(sum(g.^2));
    
    %mylg(n_iter) = lg
    %% compute direction h, and Newton Decrement Lambda
    invH = inv(H);
    h = -invH * g;
    Lambda_sqrt = g' * invH * g;
    %% backtrack
    t = mybacktrack(X,y,z,h,g);
    myt(n_iter) = t;
    
    %% update z
    z = z + t*h;
end
a = z(1:end-1);
b = z(end);
%end

ratio_log = log(myg(n_iter-5: n_iter))./log(myg(n_iter-6: n_iter-1))
plot(n_iter-5: n_iter, ratio_log)
    
    
    
    
    