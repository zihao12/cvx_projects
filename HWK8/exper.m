seeds = 1:20;
exper_niter = [];
for i = 1:length(seeds)
    niter = hwk8p4_exper(seeds(i));
    exper_niter = [exper_niter, niter];
end
fprintf("number of newton steps in experiments are:\n");
disp(exper_niter)
    