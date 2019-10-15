%% implement lasso regression using admm
%% min 1/2 |Ax-b|^2 + lambda |x|_1

randn('state',0);
rand('state',0);

%% generate data
n = 100;
p = n*4;
[A,b, xtrue] = generate_data(n,p);

% lam = 0.1*max(abs(A'*b));
lam = 10;
rho = 1;

fprintf("lasso regression using admm\n");
tic;
[x,z,u] = myadmm(A,b,lam,rho);
timing = toc;
fprintf('Computation took %0.2f seconds.\n',timing)

%% lasso regression
fprintf("lasso regression using cvx\n");
tic;
[xv,zv] = myvalidation(A,b,lam, rho);
timing = toc;
fprintf('Computation took %0.2f seconds.\n',timing);

fprintf("compare with cvx\n");
fprintf("truth obj : %f\n", obj(A,b,xtrue, lam));
fprintf("admm  obj : %f\n", obj(A,b,z, lam));
fprintf("cvx   obj : %f\n", obj(A,b,zv, lam));

fprintf("number of nonzeros in truth         : %d\n", sum(abs(xtrue) > 1e-08));
fprintf("number of nonzeros in admm solution: %d\n", sum(abs(x) > 1e-08));
fprintf("number of nonzeros in cvx solution : %d\n", sum(abs(xv) > 1e-08));

% fprintf('nonzero in truth: %d\n ', xtrue(abs(xtrue) > 1e-05));
% fprintf('nonzero in admm : %d\n ', x(abs(x) > 1e-05));
% fprintf('nonzero in cvx  :%d\n ', xv(abs(xv) > 1e-05));




%fprintf("mean difference with z: %f\n", mean((z-zv).^2));



 
 