function FCAsymIndex

% path = '/mnt/NCPL09/TMSRobustArticle/CBTRTData/FunImgARTCSFW'
% outdir = '/mnt/NCPL09/TMSRobustArticle/CBTRTData/CFHReliability/'
rThr = 0.25 ;
path=uigetdir;
outdir=uigetdir;

[TMSPath, fileN, extn] = fileparts(which('TMStarget.m'))  ;
maskdir = [TMSPath, filesep, 'mask', filesep, 'GreyMask20BG_618361.nii' ]; 

sublist = dir (path)
[mhead mdata] = TMSReadNii ([maskdir]) ;
           
dim1  = mhead.dim(1); dim2  = mhead.dim(2) ;dim3 = mhead.dim(3) ;
mdata = reshape(mdata,dim1,dim2,dim3) ;
lmdata = mdata; rmdata = mdata;

lmdata(round(dim1/2)+1:dim1,:,:) = 0 ;  
lmdata = reshape (lmdata,dim1*dim2*dim3,1) ;

rmdata(floor(1:dim1/2),:,:) = 0 ;
rmdata = reshape (rmdata,dim1*dim2*dim3,1) ;

h=waitbar(0,'Please wait...');
for i = 3 : length (sublist)
     imglist = dir ([path,filesep,sublist(i).name,filesep,'*.nii'])  ;
   [head data] = TMSReadNii([path,filesep,sublist(i).name,filesep,imglist(1).name]) ;

    waitbar((i-2)/length(sublist));
  fprintf('\n FC-based AI Calculating...');
 
    %% reference: DPABI Degree Centrality Calculating
    CUTNUMBER=100; % More cut needed for degree centrality calculation
     [alm blm] = find(lmdata) ; % lm short for Left Mask hemisphere
     [arm brm] = find(rmdata) ;

AllVolumeL = data(alm,:)' ; %
AllVolumeR = data(arm,:)' ; %
AllVolumeL = (AllVolumeL-repmat(mean(AllVolumeL),size(AllVolumeL,1),1))./repmat(std(AllVolumeL),size(AllVolumeL,1),1);   %Zero mean and one std
AllVolumeL(isnan(AllVolumeL))=0;
AllVolumeR = (AllVolumeR-repmat(mean(AllVolumeR),size(AllVolumeR,1),1))./repmat(std(AllVolumeR),size(AllVolumeR,1),1);   %Zero mean and one std
AllVolumeR(isnan(AllVolumeR))=0;

FC_LLSum =  zeros(length(alm),1); FC_LRSum = FC_LLSum ;
FC_RRSum =  zeros(length(arm),1); FC_RLSum = FC_RRSum ;
  
SegmentLength = ceil(size(AllVolumeL,2) / CUTNUMBER);
CUTNUMBERT = ceil(size(AllVolumeL,2) / SegmentLength); % Revise CUTNUMBER in case SegmentLength*CUTNUMBER is too bigger than size(AllVolume,2)
for iCut=1:CUTNUMBERT
    if iCut~=CUTNUMBERT
        Segment = (iCut-1)*SegmentLength+1 : iCut*SegmentLength;
    else
        Segment = (iCut-1)*SegmentLength+1 : size(AllVolumeL,2);
    end
    FC_Segment = AllVolumeL(:,Segment)'*AllVolumeL/( length(head) -1) ;
    FC_LLSum(Segment) = sum(FC_Segment > rThr,2);

    FC_Segment = AllVolumeL(:,Segment)'*AllVolumeR/(  length(head) -1);
    FC_LRSum(Segment) = sum(FC_Segment > rThr,2);
    
    fprintf('.');
end

SegmentLength = ceil(size(AllVolumeR,2) / CUTNUMBER);
CUTNUMBERT = ceil(size(AllVolumeR,2) / SegmentLength); % Revise CUTNUMBER in case SegmentLength*CUTNUMBER is too bigger than size(AllVolume,2)
for iCut=1:CUTNUMBERT
    if iCut~=CUTNUMBERT
        Segment = (iCut-1)*SegmentLength+1 : iCut*SegmentLength;
    else
        Segment = (iCut-1)*SegmentLength+1 : size(AllVolumeR,2);
    end

    FC_Segment = AllVolumeR(:,Segment)'*AllVolumeR/(  length(head) -1);
    FC_RRSum(Segment) = sum(FC_Segment > rThr ,2);
    
    FC_Segment = AllVolumeR(:,Segment)'*AllVolumeL/(  length(head) -1);
    FC_RLSum(Segment) = sum(FC_Segment > rThr ,2);
     fprintf('.');
end
    FC_LH_Delta = FC_LLSum/length(alm)-FC_LRSum/length(arm);
    FC_RH_Delta = FC_RRSum/length(arm)-FC_RLSum/length(alm);
%%
OutLHSumBrain=zeros(size(data,1),1);
OutLHSumBrain(alm,1)= FC_LH_Delta;

OutRHSumBrain=zeros(size(data,1),1);
OutRHSumBrain(arm,1)= FC_RH_Delta;


 TMSWriteNii (reshape(OutLHSumBrain+OutRHSumBrain,dim1,dim2,dim3),mhead,[outdir,filesep,sublist(i).name '_AI.nii'])
end
 close(h)


   
   