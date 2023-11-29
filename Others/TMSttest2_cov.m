function [T P] = TMSttest2_cov(DepVar,GroupLabel, Covs)
% DepVar=[1 2 34 4 5 4 5 11 44]'
% GroupLabel=[1 1 1 1 1 2 2 2 2]'  
% Covs = [1 2 1 2 4 5 3 3 4 ;  1 2 1 1 1 1 1 1 2]'  
Df_E=size(DepVar,1)-2-size(Covs,2);

[b,r,SSE_H] = rest_regress_ss(DepVar,[ones(size(DepVar,1),1) , Covs]);
                    % Calulate SSE
 [b,r,SSE] = rest_regress_ss(DepVar,[ones(size(DepVar,1),1),GroupLabel, Covs]   );
                    % Calculate F
  F=((SSE_H-SSE)/1)/(SSE/Df_E);
  P =1-fcdf(F,1,Df_E)
  T=sqrt(F)*sign(b(2))

end

