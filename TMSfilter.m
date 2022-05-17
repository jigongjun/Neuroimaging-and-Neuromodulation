function AllVolume = TMSfilter(DataVol,MaskVol,TR,AHighPass_LowCutoff, ALowPass_HighCutoff)

CUTNUMBER = 10;
Vol4d=DataVol';
% MaskDataOneDim=reshape(MaskVol,1,[]);
MaskIndex = find(MaskVol);
Vol4d=Vol4d(:,MaskIndex);

%Remove the mean.
theMean=mean(Vol4d);
Vol4d=Vol4d-repmat(theMean,[size(Vol4d,1),1]);
SegmentLength = ceil(size(Vol4d,2) / CUTNUMBER); 

for iCut=1:CUTNUMBER
    if iCut~=CUTNUMBER
        Segment = (iCut-1)*SegmentLength+1 : iCut*SegmentLength;
    else
        Segment = (iCut-1)*SegmentLength+1 : size(Vol4d,2);
    end
        Vol4d(:,Segment) = TMSIdealFilter(Vol4d(:,Segment),TR, [AHighPass_LowCutoff ALowPass_HighCutoff]);
end

AllVolume = zeros(size(DataVol,1),size(DataVol,2));
AllVolume(MaskIndex,:) = Vol4d'+repmat(theMean',[1,size(DataVol,2)]);% Add mean back
% AllVolume(MaskIndex,:) = Vol4d';



 