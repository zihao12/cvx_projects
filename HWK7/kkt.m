function [v,w] = kkt(H,A,g,h)
%% solve KKT systems
invH = diag(diag(H).^(-1)); %% H is diagonal matrix
w = inv(A*invH*A') * (h - A * invH*g); 
v = - invH * (g + A' *  w);
end