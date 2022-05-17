function Vol4d=TMSdetrend(Vol4d)
    CUTNUMBER=10;
    Dim1=size(Vol4d,1) ;  Dim2=size(Vol4d,2) ;  Dim3=size(Vol4d,3) ;  Dim4=size(Vol4d,4) ;
    Vol4d=reshape(Vol4d,[],Dim4)';
    theMean=mean(Vol4d);
    SegmentLength = ceil(size(Vol4d,2) / CUTNUMBER);
    for iCut=1:CUTNUMBER
        if iCut~=CUTNUMBER
            Segment = (iCut-1)*SegmentLength+1 : iCut*SegmentLength;
        else
            Segment = (iCut-1)*SegmentLength+1 : size(Vol4d,2);
        end
            Vol4d(:,Segment) = detrend(Vol4d(:,Segment));
    end
    Vol4d=Vol4d+repmat(theMean,[Dim4,1]);
    Vol4d=reshape(Vol4d',[Dim1,Dim2,Dim3,Dim4]);