function [v,w] = kkt(H,A,g,h)
    %% solve KKT systems
    invH = inv(H); 
    %w = inv(A*invH*A') * (h - A * invH*g); 
    Hinvg = H \g;
    w = (A*invH*A')\ (h - A * Hinvg); 
    v = - invH * (g + A' *  w);
%     [m n] = size(A);
%     HA = [H A'];
%     A0 = [A, zeros(m,m)];
%     Hexpand = [HA' A0']';
%     gh = - vertcat(g,h);
%     out = Hexpand\gh;
%     v = out(1:n);
%     w = out(n+1:end);
end