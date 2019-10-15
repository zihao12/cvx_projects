function [x,z,u] = myadmm(A,b,lam,rho)
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
    timing = toc;
    fprintf('preprocessing took %0.2f seconds.\n',timing)    
    %% iteration

    e_pri = 1e-08*sqrt(p); %% can adjust it using formula
    e_dual = 1e-08*sqrt(n);
    maxiter = 10000;
    niter = 0;
    
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
    fprintf("finish fitting after %d iterations\n", niter);
    fprintf("primal residual %f\n", norm(r));
    fprintf("dual   residual %f\n", norm(s));

end