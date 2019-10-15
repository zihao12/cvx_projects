function [r,s] = res(x,z,z_old, rho)
    %% compute primal and dual residual 
    r = x - z ;
    s = -rho * (z - z_old); 
end