%% implement lasso regression using admm
%% min 1/2 |Ax-b|^2 + lambda |x|_1
lam = 10;
rho = 1;

%% generate data
ns = 50:50:550;
niters = [];
pretimes = [];
itertimes = [];

for i = 1: length(ns)
    niters0 = [];
    pretimes0 = [];
    itertimes0 = [];
    
    seeds = 1:10;
    for s = 1: length(seeds)
        randn('state',seeds(s));
        rand('state',seeds(s));
        n = ns(i);
        p = n*4;
        [A,b, xtrue] = generate_data(n,p);

        fprintf("lasso regression using admm; size n = %d\n", n);
        lam = 1;
        rho = 2;
        [x,z,u,niter,pretime, itertime] = myadmm_report(A,b,lam,rho);

        niters0 = [niters0, niter];
        pretimes0 = [pretimes0, pretime];
        itertimes0 = [itertimes0, itertime];
    end       
    niters = [niters,mean(niters0)];
    pretimes = [pretimes, mean(pretimes0)];
    itertimes = [itertimes,mean(itertimes0)];
end

scatter(ns,pretimes + itertimes);
title("q3: ns vs runtime");
xlabel("n");
ylabel("runtime");
saveas(gcf,'n_vs_runtime.png');

scatter(ns,niters);
title("q3: ns vs niter");
xlabel("n");
ylabel("iteration");
saveas(gcf,'n_vs_niter.png');

scatter(ns,itertimes ./ niters);
title("q3: ns vs runtime per iteration");
xlabel("n");
ylabel("untime per iteration");
saveas(gcf,'n_vs_runtimePiter.png');



 
 