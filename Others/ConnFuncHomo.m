function ConnFuncHomo
CUTNUMBER=100
% path = '/home/NCPL09/Desktop/MRIDATA/ReseachPlan/Autism/analysis_fun/FunImgARWCSF'
% outdir = '/home/NCPL09/Desktop/MRIDATA/ReseachPlan/Autism/analysis_fun/tongji/FHC'
path=uigetdir;
outdir=uigetdir;

sublist = dir (path)
[TMSPath, fileN, extn] = fileparts(which('TMStarget.m'))  ;
[mhead mdata] = TMSReadNii ( [TMSPath, filesep, 'mask', filesep, 'GreyMask20BG_618361.nii' ] ) ;

dim1  = mhead.dim(1); dim2  = mhead.dim(2) ;dim3 = mhead.dim(3) ;
mdata = reshape(mdata,dim1,dim2,dim3) ;
lmdata = mdata; rmdata = mdata;

lmdata(round(dim1/2)-1:dim1,:,:) = 0 ;  
lmdata = reshape (lmdata,dim1*dim2*dim3,1) ;

rmdata(floor(1:dim1/2)+2,:,:) = 0 ;
rmdata = reshape (rmdata,dim1*dim2*dim3,1) ;

 [alm blm] = find(lmdata) ; % lm short for Left Mask hemisphere
 [arm brm] = find(rmdata) ;
     
fprintf('\n FuncHomoConn Calculating...');

%% To get the group level homotopic voxels' location
MaxR=zeros(size(alm,1),1); LocR = MaxR;

SegmentLength = ceil( length(alm) / CUTNUMBER);
CUTNUMBERT = ceil(  length(alm) / SegmentLength); % Revise CUTNUMBER in case SegmentLength*CUTNUMBER is too bigger than size(AllVolume,2)
for iCut=1:CUTNUMBERT
     if iCut~=CUTNUMBERT
             Segment = (iCut-1)*SegmentLength+1 : iCut*SegmentLength;
       else
             Segment = (iCut-1)*SegmentLength+1 : size(AllVolumeL,2);
       end
    RLR_Segment = zeros(length(Segment),length(arm)) ;
   for i = 3 : length(sublist)
       imglist = dir ([path,filesep,sublist(i).name,filesep,'*.nii'])  ;
       [head data] = TMSReadNii([path,filesep,sublist(i).name,filesep,imglist(1).name]) ;
   
       CUTNUMBER=100; % More cut needed for degree centrality calculation
       AllVolumeL = data(alm,:)' ; %
       AllVolumeR = data(arm,:)' ; %
       AllVolumeL = (AllVolumeL-repmat(mean(AllVolumeL),size(AllVolumeL,1),1))./repmat(std(AllVolumeL),size(AllVolumeL,1),1);   %Zero mean and one std
       AllVolumeL(isnan(AllVolumeL))=0;
       AllVolumeR = (AllVolumeR-repmat(mean(AllVolumeR),size(AllVolumeR,1),1))./repmat(std(AllVolumeR),size(AllVolumeR,1),1);   %Zero mean and one std
       AllVolumeR(isnan(AllVolumeR))=0;
     
      RLR_Segment = RLR_Segment+AllVolumeL(:,Segment)'*AllVolumeR/(  length(head) -1);
      fprintf('.');
    end
        [MaxR(Segment,1) LocR(Segment,1)]= max(RLR_Segment,[],2);
end


LocL=LocL';

%% computing HFC using the homotopically paired voxels

h=waitbar(0,'Please wait...');
for k = 3 : length (sublist)
    waitbar((i-2)/length(sublist));
    
   LAI = zeros (dim1*dim2*dim3,1) ;
   [head data] = TMSReadNii( [path,filesep,sublist(k).name,filesep, imglist(1).name] ) ;
   
   %%
   CUTNUMBER=100; % More cut needed for degree centrality calculation
AllVolumeL = data(alm,:)' ; %
AllVolumeR = data(arm,:)' ; %
AllVolumeL = (AllVolumeL-repmat(mean(AllVolumeL),size(AllVolumeL,1),1))./repmat(std(AllVolumeL),size(AllVolumeL,1),1);   %Zero mean and one std
AllVolumeL(isnan(AllVolumeL))=0;
AllVolumeR = (AllVolumeR-repmat(mean(AllVolumeR),size(AllVolumeR,1),1))./repmat(std(AllVolumeR),size(AllVolumeR,1),1);   %Zero mean and one std
AllVolumeR(isnan(AllVolumeR))=0;
RLRi  =  zeros(length(alm),length(arm)); 

SegmentLength = ceil(size(AllVolumeL,2) / CUTNUMBER);
CUTNUMBERT = ceil(size(AllVolumeL,2) / SegmentLength); % Revise CUTNUMBER in case SegmentLength*CUTNUMBER is too bigger than size(AllVolume,2)
for iCut=1:CUTNUMBERT
    if iCut~=CUTNUMBERT
        Segment = (iCut-1)*SegmentLength+1 : iCut*SegmentLength;
    else
        Segment = (iCut-1)*SegmentLength+1 : size(AllVolumeL,2);
    end
    RLRi (Segment,:) = AllVolumeL(:,Segment)'*AllVolumeR/(  length(head) -1);
     fprintf('.');
end

% SegmentLength = ceil(size(AllVolumeR,2) / CUTNUMBER);
% CUTNUMBERT = ceil(size(AllVolumeR,2) / SegmentLength); % Revise CUTNUMBER in case SegmentLength*CUTNUMBER is too bigger than size(AllVolume,2)
% for iCut=1:CUTNUMBERT
%     if iCut~=CUTNUMBERT
%         Segment = (iCut-1)*SegmentLength+1 : iCut*SegmentLength;
%     else
%         Segment = (iCut-1)*SegmentLength+1 : size(AllVolumeR,2);
%     end
%     FC_RL(Segment) = AllVolumeR(:,Segment)'*AllVolumeL/(  length(head) -1);
%      fprintf('.');
% end
%%
   
   
   
%    RLRi = TMSfastCorr(data(alm,:)',data(arm,:)') ;
   Lmaxval = zeros(size(LocR,1),1) ;
   for jj = 1 : length(LocR)
       RLRil = RLRi(jj,:) ;
       Lmaxval(jj,1) =  RLRil(LocR(jj,1))  ;
   end
   LAI(alm) =  Lmaxval;

   RAI = zeros (dim1*dim2*dim3,1) ;
   RRLi = RLRi';
   Rmaxval = zeros(size(LocL,1),1) ;
   for ii = 1 : length(LocL)
       RRLil = RRLi(ii,:) ;
       Rmaxval(ii,1) =  RRLil(LocL(ii,1))  ;
   end
   RAI(arm) =  Rmaxval;
   
   HFC = RAI+LAI ;   zHFC=HFC;
   [HFCa HFCb] = find(HFC) ;
   HFC2 = (HFC(HFCa)-mean(HFC(HFCa),1))/std(HFC(HFCa),1);
   zHFC(HFCa) = HFC2 ;
   TMSWriteNii (reshape(zHFC,dim1,dim2,dim3),mhead,[outdir,filesep,'z' sublist(k).name '_CFH.nii'])

%    mHFC = HFC/mean(HFC(find(HFC)),1);
%    TMSWriteNii (reshape(mHFC,dim1,dim2,dim3),mhead,[outdir,filesep,'m' sublist(k).name '_HFC.nii'])

end
close(h)





 