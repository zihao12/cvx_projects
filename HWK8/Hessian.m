function [H] = Hessian(t, x, C, d)
    H0 = Hessian0(x);
    u = - (C*x - d).^(-1);
%     D = diag(u);
%     H = t * H0 + (D*C)' * (D*C);
    D = diag(u.^2);
    H = t * H0 + C' * D * C;
end