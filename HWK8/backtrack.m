function[l] = backtrack(t, x,v,g, C,d)
    % v is newton direction
    % x is current param
    % g is current gradient
    beta = 0.8;
    alpha = 0.01;
    l = 1;
    maxiter2 = 1000;
    for i = 1:maxiter2
        if i == maxiter2
            fprintf("backtrack reaches max\n");
        end
       newval = obj(t, x + l*v, C,d);
       extrap = obj(t, x, C,d) + l * alpha * g' * v;
       if extrap == +Inf
           fprintf("extrap +inf\n");
       end
       if newval <= extrap
           break
       end
       l = beta * l;
    end
end
