function [val] = obj(A,b,x, lam)
    val = 0.5* power(2,norm(A*x-b,2)) + lam*norm(x,1);
end
