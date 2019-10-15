n = 100;
p = 30;
randn('state',0);
rand('state',0);
xhat = rand(n,1);
fprintf("---------------------------------\n");
fprintf("test feasible start\n");
[x1,lambda1,x2, lambda2] = hwk7p4(xhat);
fprintf("---------------------------------\n");

fprintf("test infeasible start\n");
[x1,lambda1,x2, lambda2] = hwk7p4(ones(n,1));
