function r = invpearson(p,n)
% from p-value to Pearson's linear correlation value . just return positive
% corr value . r = [r,-r]; formula deduced by t-distribution: t = rho.*sqrt((n-2)./(1-rho.^2)).
t = tinv ( 1-p/2, n-2) ;
r = sqrt(t^2/(n-2 + t^2)) ;
