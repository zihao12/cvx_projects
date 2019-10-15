function [x,z,u,niter,pretime, itertime] = myadmm_report(A,b,lam,rho)
    %% to do 
    %% tolerance
    
    %% initialization
    [n,p] = size(A);
    x = ones(p,1);
    z = ones(p,1);
    u = ones(p,1);
    
    %% computation before iteration
    %% compute inv(A'A + rho*I), call it M and A'b, call it d
    
    tic;
    M = computeM(A,rho);
    d = A'*b;
    pretime = toc;
    fprintf('preprocessing took %0.2f seconds.\n',pretime);   
    %% iteration
    
%     r = 1e+3;
%     s = 1e+3;
    e_pri = 1e-05 * sqrt(p); %% can adjust it using formula
    e_dual = 1e-05 * sqrt(n);
    maxiter = 10000;
    niter = 0;
    
    tic;
    while 1
        niter = niter + 1;
        x = M*(d + rho* (z - u));
        z_old = z;
        z = soft(x+u,lam/rho);
        u = u + x - z;
        
        %%% primal and dual residual
        [r,s] = res(x,z, z_old, rho);
        if (norm(r) <= e_pri) && (norm(s) <= e_dual)
            break
        end
        if niter > maxiter
            break
        end
    end
    itertime = toc;
    fprintf('admm iteration took %0.2f seconds.\n',itertime);   
    fprintf("finish fitting after %d iterations\n", niter);
    fprintf("primal residual %f\n", norm(r));
    fprintf("dual   residual %f\n", norm(s));

end