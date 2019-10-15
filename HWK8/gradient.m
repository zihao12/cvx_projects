function [g] = gradient(t, x, C, d)
    g0 = gradient0(x);
    u = - 1./(C*x - d);
    g = t * g0 + C' * u; 
end