function R = TMSfastCorr(X, Y)
%
% XiNian.Zuo@nyumc.org 

[numSamp1 numVar1] = size(X); % n*p1
[numSamp2 numVar2] = size(Y); % n*p2
if (numSamp1 ~= numSamp2)
    disp('The two matices must have the same size of rows!')
else
    X = (X - repmat(nanmean(X), numSamp1, 1))./repmat(nanstd(X, 0, 1), numSamp1, 1);
    Y = (Y - repmat(nanmean(Y), numSamp1, 1))./repmat(nanstd(Y, 0, 1), numSamp1, 1);
    X(isnan(X))=0 ;
    Y(isnan(Y))=0 ;
    

    R = X' * Y / (numSamp1 - 1);
%    R(isnan(R))=0 ;
end
end