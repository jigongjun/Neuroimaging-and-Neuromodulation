function cor=TMSmni2mat(mni,T)


mni = round(mni);
cor = inv(T)*[mni(:,1) mni(:,2) mni(:,3) ones(size(mni,1),1)]';
cor = cor';
cor(:,4) = [];
return;