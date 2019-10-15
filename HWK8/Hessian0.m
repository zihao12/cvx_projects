function [H] = Hessian0(x)
    H = diag(1./x);
end