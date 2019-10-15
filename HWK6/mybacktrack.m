function [t] = mybacktrack(X,y,z,h,g)
    alpha = 0.1;
    beta = 0.7; % rough
    t = 1;
    old_val = compute_f(X,y,z);
    max_iter2 = 100;
    n_iter2 = 1;
    while 1
        n_iter2 = n_iter2 + 1;
        new_val =compute_f(X,y,z + t*h);
        if new_val < old_val + alpha * t * g'*h; 
            break
        end
         if n_iter2 > max_iter2
            break
         end 
        t = beta*t;
    end
end




