function[t] = backtrack(x,v,g)
    % v is newton direction
    % x is current param
    % g is current gradient
    beta = 0.8;
    alpha = 0.3;
    t = 1;
    maxiter2 = 20;
    for i = 1:maxiter2
       newval = obj(x + t*v);
       extrap = obj(x) + t * alpha * g' * v;
       if newval < extrap
           break
       end
       t = beta * t;
    end
end