 function [MNICen MATCen]=TMSMNICenter(imagedir)
% images = spm_select(1,'image','masks');
[ hdr dat] = TMSReadNii(imagedir);
dat = reshape(dat,hdr.dim(1),hdr.dim(2),hdr.dim(3));
[dx dix] = sort(dat(dat>0));
DX = unique(dx);
for i = 1:length(DX)
    DAT = zeros(size(dat));
    DAT(dat==DX(i)) = 1;
    STATS = regionprops(DAT,'Centroid','Area');
    Centre(i,:) = STATS.Centroid;
    Area(i,:) = STATS.Area;
end

MATCen = [Centre(:,2),Centre(:,1),Centre(:,3)];
MNICen = TMSmat2mni  (MATCen, hdr.mat);


