function [x, lambda, nsteps] = hwk8p4_exper(n,m,p)
    %% generate data
    randn('state',0);
    rand('state',0);
    A = rand(m,n);
    C = rand(p,n);
    v = rand(p,1);
    xhat = rand(n,1);
    b = A * xhat;
    d = C * xhat + v;

    %% initialize
     t = 1;
     e = 1e-10; %% when e is too small, H becomes huge, then invH
     mu = 10;

    %x = FindFease(C,d,A,b); %% not working for now
     x = xhat;

     %% iteratively run logbarrier algorithm until p/t < e
     iters = [];
     while 1
         if p/t < e
             break
         end
         [x,lambda,n_iter] = logbarrier2(t, x, A, b, C, d);
         iters = [iters, n_iter];
         t = mu*t;
     end
     nsteps = sum(iters);
end
