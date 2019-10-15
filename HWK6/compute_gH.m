%% compute gradient and Hessian
function [g,H] = compute_gH(X,y,z)
    %g_old = g;
    p = X * z;
    d = exp(p) ./ (1+exp(p));
    v = d ./ (1+exp(p));
    g = X' * (d - y);
    H = X' * diag(v) * X;
    %lg = sqrt(sum(g.^2))/sqrt(sum(g_old.^2));
end