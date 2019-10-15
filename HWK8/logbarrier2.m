function [x,lambda, n_iter1] = logbarrier2(t, x0, A, b, C, d)
    fprintf("current t: %d\n", t);
    e = eps;
    [m, n] = size(A);
    x = x0;
    lam_sq = 1000;
    n_iter1 = 0;
    while lam_sq/2 > e
        if min(x) < 0
            disp("x neg");
            disp(n_iter1);
            break;
        end
        
        %% compute gradient g, Hessian H 
        g = gradient(t, x, C,d);
        H = Hessian(t, x, C,d);
        if rank(H) < n
            fprintf("rank of H: %d\n", rank(H));
        end
        n_iter1 = n_iter1 + 1;
        %% compute newton step
        h = zeros(m,1);
        [v,w] = kkt(H,A,g,h);
        %%%% 
        if ~isreal(v)
            disp("not real");
            disp(n_iter1);
            break;
        end
        %% compute newton decrement
        lam_sq = -g' * v;

        %% backtrack
        l = backtrack(t, x,v,g, C,d);
        x = x + l * v;
    end
    lambda = w;
    fprintf("standard newton finished after  : %d iterations.\n", n_iter1);
end