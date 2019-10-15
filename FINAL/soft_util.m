function [yi] = soft_util(xi, bar)
    %% elementwise softthresholding
    if xi > bar
        yi = xi - bar;
        return
    end
    if xi < -bar
        yi = xi + bar;
        return
    end
    yi = 0;
end