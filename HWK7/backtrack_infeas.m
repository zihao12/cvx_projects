function [t] = backtrack_infeas(v,w,x,lambda,g,A,b)
    t = 1;
    alpha = 0.3;
    beta = 0.8;
    maxiter = 20;
    for i = 1:maxiter
        if compute_r_norm(x + t*v,lambda + t*w, g,A,b) < (1-alpha*t)*compute_r_norm(x,lambda, g,A,b)
            break
        end
        t = beta*t;
    end

end