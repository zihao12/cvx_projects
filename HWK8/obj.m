function [val] = obj(t, x, C, d)
    if min(x) <= 0 %% prevent complex numbers
        val = +Inf; 
        return
    end
    if min(d - C*x) <= 0
        val = +Inf;
        return
    end
    val = t * sum(x.*log(x)) - sum(log(d - C*x));
end