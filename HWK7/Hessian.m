function [H] = Hessian(x)
    H = diag(1./x);
end