%% compute f(z)
function [val] = compute_f(X,y,z)
    p = X * z;
    val = -sum(p .* y) + sum(log(1 + exp(p)));
end