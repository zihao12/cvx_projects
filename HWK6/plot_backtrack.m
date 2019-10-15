function [out] = plot_backtrack(X,z,h,delta)
    
%disp(delta)
    alpha = 0.4
    beta = 0.1 % rough
    p = X * z
    old_val = - sum(p) + sum(log(1+exp(p)))
    myt = [0:1e-6:1e-3]
    out = zeros(1,length(myt))
    
    for i = 1:length(myt)
        t = myt(i)
    
        pnew = X * (z + t*h)
        new_val = - sum(pnew) + sum(log(1+exp(pnew)))
        extrap = old_val + alpha * t * delta
        out(i) = new_val - extrap
    end       
end