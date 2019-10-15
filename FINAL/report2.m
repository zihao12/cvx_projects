%% implement lasso regression using admm
%% min 1/2 |Ax-b|^2 + lambda |x|_1

randn('state',0);
rand('state',0);
lam = 10;
rho = 1;

%% experiment
n = 200;
p = n*4;
[A,b, xtrue] = generate_data(n,p);

fprintf("lasso regression using admm; size n = %d\n", n);
lam = 1;
rho = 2;
[x,z,u,niter,rr,ss] = myadmm_report2(A,b,lam,rho);

niters = [niters, niter];
pretimes = [pretimes, pretime];
itertimes = [itertimes, itertime];

% plot(1:niter,log10(rr));
% title("q5: niter vs prime residual");
% xlabel("niter");
% ylabel("prime residual (log 10)");
% saveas(gcf,'niter_vs_prime_residual.png');
% 
% plot(1:niter,log10(ss));
% title("q5: niter vs dual residual");
% xlabel("niter");
% ylabel("dual residual (log 10)");
% saveas(gcf,'niter_vs_dual_residual.png');

top = 200;
plot(1:top,log10(rr(1:top)));
title("q5: niter vs prime residual");
xlabel("niter");
ylabel("prime residual (log 10)");
saveas(gcf,'niter_vs_prime_residual_top.png');

plot(1:top,log10(ss(1:top)));
title("q5: niter vs dual residual");
xlabel("niter");
ylabel("dual residual (log 10)");
saveas(gcf,'niter_vs_dual_residual_top.png');


 
 
