function p=chi2test2(x)

s=size(x,1) ;
r=size(x,2) ;
np=sum(x,2)/sum(sum(x))*sum(x);
q=sum(sum((x-np).^2./(np)));
p=1-gammainc(q/2,(r-1)*(s-1)/2) ;
 
