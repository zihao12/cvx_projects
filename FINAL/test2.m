%% implement lasso regression using admm
%% min 1/2 |Ax-b|^2 + lambda |x|_1

randn('state',0);
rand('state',0);

%% generate data
n = 100;
p = n*4;
[A,b, xtrue] = generate_data(n,p);

%% lasso regression
fprintf("lasso regression using admm\n");
lam = 1;
rho = 2;
tic;
[x,z,u] = myadmm(A,b,lam,rho);
timing = toc;
fprintf('Computation took %0.2f seconds.\n',timing)

fprintf("lasso regression using cvx\n");
tic;
[xv,zv] = myvalidation(A,b,lam, rho);
timing = toc;
fprintf('Computation took %0.2f seconds.\n',timing);

fprintf("lasso regression using dai\n");
e1 = 1e-08;
e2 = 1e-08;
tic;
[xd,yd,zd,pstard] = admm(A,b,ones(p,1),ones(p,1),ones(p,1),rho,lam,e1,e2);
%[xv,zv] = myvalidation(A,b,lam, rho);
timing = toc;
fprintf('Computation took %0.2f seconds.\n',timing);


fprintf("compare with cvx\n");
fprintf("truth obj : %f\n", obj(A,b,xtrue, lam));
fprintf("admm  obj : %f\n", obj(A,b,x, lam));
fprintf("cvx   obj : %f\n", obj(A,b,xv, lam));
fprintf("dai   obj : %f\n", obj(A,b,xd, lam));
fprintf("mean difference in xv: %12f\n", mean((x-xv).^2));
fprintf("mean difference in x: %12f\n", mean((x-xtrue).^2));
fprintf("mean difference in xd: %12f\n", mean((x-xtrue).^2));

%fprintf("mean difference with z: %f\n", mean((z-zv).^2));



 
 