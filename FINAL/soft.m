function [y] = soft(x,bar)        
    %% softthresholding function
    y = arrayfun(@(xi) soft_util(xi, bar), x);
end