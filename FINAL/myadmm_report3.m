function [x,z,u,niter,rs,ss, gaps] = myadmm_report3(A,b,lam,rho, pstar, tol)
    %% in ADMM run, I record r, s, p-pstar
    
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
    fprintf('preprocessing took %0.5f seconds.\n',pretime);   
    %% iteration
    
%     r = 1e+3;
%     s = 1e+3;
    e_pri = tol * sqrt(p); %% can adjust it using formula
    e_dual = tol * sqrt(n);
    maxiter = 10000;
    niter = 0;

    rs = [];
    ss = [];
    gaps = [];
    
    tic;
    while 1
        niter = niter + 1;
        x = M*(d + rho* (z - u));
        z_old = z;
        z = soft(x+u,lam/rho);
        u = u + x - z;
        
        %% compute p - pstar
        p = obj(A,b,z,lam);
        gaps = [gaps, p - pstar];
        
        %%% primal and dual residual
        [r,s] = res(x,z, z_old, rho);
	
        rs = [rs, norm(r)];
        ss = [ss, norm(s)];

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
