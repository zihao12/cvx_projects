function [opt] = OPT(eps)

        A = [-4 12 -2 1; -17 12 7 11; 1 0 -6 1; 3 3 22 -1; -11 2 -1 -8]
        b = [8 13 -4 27 -18]
        f = [6 15 -13 48 8]
        c = [49 -34 -50 -5]
        d = [3 8 21 25]

        b = transpose(b)
        f = transpose(f)
        c = transpose(c)
        d = transpose(d)
        
        cvx_begin
                variables x(4) 
                minimize(dot(c + eps*d,x))
                subject to 
                    A*x - (b + eps*f) <= zeros(5,1)
        cvx_end
        %X = x
        opt = cvx_optval
end