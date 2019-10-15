function [val] = compute_r_norm(x,lambda,g,A,b)
    r_vec = vertcat(g + A' * lambda, A*x - b);
    val = sqrt(sum(r_vec.^2));
end