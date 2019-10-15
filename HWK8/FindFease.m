function [x0] = FindFease(C,d,A,b)
    [p n] = size(C);
    cvx_begin
        variables x(n) s(1);
        minimize(s);
        subject to 
            C * x - d  - s <= 0;
            A*x == b;
    cvx_end
    x0 = x;
end