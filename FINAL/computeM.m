function [M] = computeM(A, rho)
    %% M = inv(A'A + rho*I)
    %% size(A) = [n,p]
    %% I consider the case when p > n
    %% formula is: 1/rho*I - 1/rho^2 A'*inv(I + 1/rho * A*A')*A
    [n,p] = size(A);
    l = 1/rho;
    M = l*eye(p) - l^2 * A' * inv(eye(n) + l*A*A')*A; %% should i reorder computation?
end