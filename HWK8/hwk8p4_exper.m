
function [niter] = hwk8p4_exper(seed)
    %% input
    n = 100;
    m = 30;
    p = 30;

    %% generate data
    randn('state',seed);
    rand('state',seed);
    A = rand(m,n);
    C = rand(p,n);
    v = rand(p,1);
    xhat = rand(n,1);
    b = A * xhat;
    d = C * xhat + v;

    %% initialize
     t = 1;
     e = 1e-10; %% when e is too small, H becomes huge, then invH
     mu = 20;

    %x = FindFease(C,d,A,b); %% not working for now
     x = xhat;

     %% iteratively run logbarrier algorithm until p/t < e
     iters = [];
     while 1
         if p/t < e
             break
         end
         [x,n_iter] = logbarrier(t, x, A, b, C, d);
         iters = [iters, n_iter];
         t = mu*t;
     end
     niter = sum(iters);
%     fprintf("finish after total iterations:%d\n", sum(iters));
% 
%     fprintf("check feasibility\n");
%     if max(abs(A*x - b)) < 1e-08
%         fprintf("equality sat!!!\n");
%     else
%         fprintf("equality fail!!!\n");
%     end
% 
%     if min(d - C*x) > 0 
%         fprintf("inequality sat!!!\n");
%     else
%         fprintf("inequality fail!!!\n");
%     end
end
