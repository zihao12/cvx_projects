% Figure 7.1: Logistic regression (GP version)
% Section 7.1.1
% changed from original gp formulation to the standard form in the book. 

randn('state',0);
rand('state',0);

a =  1;
b = -5;

m = 1000;
u = 10*rand(m,1);
y = (rand(m,1) < exp(a*u+b)./(1+exp(a*u+b)));

% order the observation data
ind_false = find( y == 0 );
ind_true  = find( y == 1 );

% X is the sorted design matrix
% first have true than false observations followed by the bias term
X = [u(ind_true); u(ind_false)];
X = [X ones(size(u,1),1)];
[m,n] = size(X);
q = length(ind_true);

% q is the number of observations that return 1; and m-q are the ones that
% return 0

% the first q rows in X return 1; and the following m-q 0. I added the bias
% term; so the linear part of logistic model should be X(:,1)*a+X(:,2)*b