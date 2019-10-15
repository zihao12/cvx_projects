function [entr] = myentropy(x)
    entr = sum(x.*log(x));
end