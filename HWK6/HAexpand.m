function [Hhat] = HAexpand(H,A)
    [p,n] = size(A);
    up = horzcat(H,A');
    down = horzcat(A,zeros(p,p));
    Hhat = vertcat(up, down);
end