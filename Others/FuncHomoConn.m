function FuncHomoConn(NCore) 

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
RLRsum=zeros(size(alm,1),size(arm,1)); RLRsum=single(RLRsum);
for i = 3 : length(sublist)
   imglist = dir ([path,filesep,sublist(i).name,filesep,'*.nii'])  ;
   [head data] = TMSReadNii([path,filesep,sublist(i).name,filesep,imglist(1).name]) ;
   RLRsum = RLRsum + TMSfastCorr(data(alm,:)',data(arm,:)') ;
end

[maxR LocR]= max(RLRsum,[],2); % LocR is the location in the 2th dimention
[maxL LocL] = max(RLRsum); 
LocL=LocL';

%% computing HFC using the homotopically paired voxels

%% parfor setting
 v = version;
 if str2num(v(end-5:end-2)) < 2016
   if NCore==0 && matlabpool('size') > 0
      matlabpool close
   elseif NCore>0 && matlabpool('size') == 0
      matlabpool ('open', NCore) 
   elseif NCore>0 && matlabpool('size') > 0
      matlabpool close
      matlabpool ('open', NCore) 
   end
   
   else
    pgcp = gcp('nocreate')
    if NCore>0 && isempty(pgcp) 
      parpool (NCore) 
   elseif NCore>0 && ~isempty(pgcp) 
      delete(gcp('nocreate'))
      parpool (NCore) 
    end
 end
%%


h=waitbar(0,'Please wait...');
parfor k = 3 : length (sublist)
    waitbar((i-2)/length(sublist));
    
   LAI = zeros (dim1*dim2*dim3,1) ;
   [head data] = TMSReadNii( [path,filesep,sublist(k).name,filesep, imglist(1).name] ) ;
   RLRi = TMSfastCorr(data(alm,:)',data(arm,:)') ; % RLR means r value of Left to Right side correlation
   Lmaxval = zeros(size(LocR,1),1) ;
   for jj = 1 : length(LocR)
       RLRil = RLRi(jj,:) ; % one i in left side have n correaltion value
       Lmaxval(jj,1) =  RLRil(LocR(jj,1))  ; % select the max location 
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
   
   HFC = RAI+LAI ;   
   
%    zHFC=HFC;
%    [HFCa HFCb] = find(HFC) ;
%    HFC2 = (HFC(HFCa)-mean(HFC(HFCa),1))/std(HFC(HFCa),1);
%    HFC2 = atanh(HFC);
%    zHFC(HFCa) = HFC2 ;
   TMSWriteNii (reshape(atanh(HFC),dim1,dim2,dim3),mhead,[outdir,filesep,'z' sublist(k).name '_CFH.nii'])
%    mHFC = HFC/mean(HFC(find(HFC)),1);
%    TMSWriteNii (reshape(mHFC,dim1,dim2,dim3),mhead,[outdir,filesep,'m' sublist(k).name '_HFC.nii'])

end
close(h)





 