function FCMap = TMSSeedFC(SeedDir,FCMaskDir,FCOutDir,AnalysisDir,subj,targetdepth)
if nargin<5
        error(' Error using ==> at least 5 arguments wanted.');
     elseif nargin==5    
       targetdepth = 0              % number of voxels, distance from cortical target to c4
    elseif nargin>6
        error('Error using ==> Too many input');
end
mkdir([FCOutDir,filesep,subj]);
[SeedPath, Seedname, sextn] = fileparts(SeedDir);
[MaskPath, Maskname, mextn] = fileparts(FCMaskDir);
[DataDir,inifd,cc] = fileparts (AnalysisDir) ;
[funhead fundata] = TMSReadNii([DataDir,filesep,inifd,filesep,subj,filesep,'fundata.nii']) ;

fundata = [fundata-repmat(mean(fundata,2),[1,size(fundata,2)])];
dim1 = funhead(1,1).dim(1);
dim2 = funhead(1,1).dim(2);
dim3 = funhead(1,1).dim(3);

   Indipath = [DataDir,filesep,'IndiMasks',filesep,subj] ;

   if ~exist (Indipath,'dir')
       xfolder = dir([DataDir,filesep,'IndiMasks',filesep,[subj '_Run*']] ) ;
       Indipath = [DataDir,filesep,'IndiMasks',filesep,xfolder(1).name] ;
   end
   
   % added by jgj 2023/05/26
   TMSWriteNii(fundata(:,1),funhead(1,1),[Indipath,filesep,'fundata1tp.nii']);
   
   if strcmp(subj(end-4:end-1),'_Run') 
      subjnew = subj(1:end-5);
   else
      subjnew = subj;
   end
   
   if ~exist([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1B.nii'])
     MATdir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1.nii']; 
     invMatDir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'iy_ac_coT1.nii']; 
   else
       MATdir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1B.nii']; 
     invMatDir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'iy_ac_coT1B.nii'];
   end
  
   %% added in 2023/04/08 by JGJ
   %% We change to compute the distance between target and scalp
   %% We enlarge the target nii to overlap c6.nii in T1Img, get the out brain area which used to compute the minimal 
   %% distance to each voxel in the target mask. All these were performed in T1 space with a 1mm resolution
    [c5head c5data] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c5ac_coT1.nii'])  ;
     [c4head c4data] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c4ac_coT1.nii'])  ;
      [c3head c3data] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c3ac_coT1.nii'])  ;
        [c2head c2data] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c2ac_coT1.nii'])  ;
         [c1head c1data] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c1ac_coT1.nii'])  ;  %using c1-c5 to exclude scattor point in c6
          
   [c6head c6data] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c6ac_coT1.nii'])  ;
     c6dim1=c6head.dim(1) ; c6dim2=c6head.dim(2) ; c6dim3=c6head.dim(3) ; 
     c6data = reshape(c6data, c6dim1,c6dim2,c6dim3) ; 
     c6data([1 c6dim1], :, :) = 1 ;       c6data(:,[1 c6dim2],:) = 1 ;          c6data(:,:,[1 c6dim3]) = 1 ;
      c6data = reshape(c6data, c6dim1*c6dim2*c6dim3,1) ;
     c6data(find(c1data+c2data+c3data+c4data+c5data))=0; %using c1-c5 to exclude scattor point in c6
     
     TMSWriteNii (c6data,c6head,[DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c6ac_coT1.nii']  ) ;
   copyfile(SeedDir ,[Indipath,filesep,[Seedname sextn]]) ;
   
   
   TMSwriteDTL(invMatDir,[Indipath,filesep,[Seedname sextn]]) ;  % chg the seed to individual space
   Seeddata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],[Indipath,filesep,['w' Seedname sextn]],[Indipath]);  % seed image in fun space

   copyfile(FCMaskDir ,[Indipath,filesep,[Maskname mextn]]) ;
     TMSwriteDTL(invMatDir,[Indipath,filesep,[Maskname mextn]]) ; % chg the mask to individual space
     
        Maskdata=TMSreslice([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c6ac_coT1.nii'],...
                                         [Indipath,filesep,['w' Maskname mextn]],[Indipath]);    % chg mask image to c6 space
        [c1head c1data] = TMSReadNii  ([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c1ac_coT1.nii']) ;  
        Maskdata=Maskdata.*reshape(c1data,c6dim1,c6dim2,c6dim3);
        Maskdata(find(Maskdata))=1 ; % exclude the white matter part
        TMSWriteNii (Maskdata, c6head, [Indipath,filesep,'TargetAreaInC6.nii']) ;
       Maskdata = reshape(Maskdata,c6dim1*c6dim2*c6dim3,1) ;
       
        TMSExtendROI( [Indipath,filesep,'TargetAreaInC6.nii'], 15); % extend the target area 15 times to overlap C6. This default value may not suitable for particular target mask
        
        movefile ([pwd,filesep,'EnlargedROI.nii'],  [Indipath,filesep,'TargetAreaInC6_Enlarged.nii']) ;
        [TAC6head TAC6data] = TMSReadNii  ([Indipath,filesep,'TargetAreaInC6_Enlarged.nii']) ; 
        OutBrainData = TAC6data.*c6data ;
        OutBrainData = reshape(OutBrainData,c6dim1*c6dim2*c6dim3,1) ;
         TMSWriteNii (OutBrainData, c6head, [Indipath,filesep,'TargetAreaInC6_outbrain.nii']) ;
         
         [navox nbvox] = find(Maskdata);
      size(navox)
      for i = 1  :  size(navox,1)
         [maskxyz(i,1) maskxyz(i,2) maskxyz(i,3)] = ind2sub([c6dim1 c6dim2 c6dim3],  navox(i)) ;
      end
        
        [naedg nbedg] = find(OutBrainData>0);
     size(naedg)
     for i = 1  :  size(naedg,1)
        [edgxyz(i,1) edgxyz(i,2) edgxyz(i,3)] = ind2sub([c6dim1 c6dim2 c6dim3],  naedg(i)) ;
     end
     distmats = pdist2( maskxyz,edgxyz); % point-by-point distance computation
     minmat = min(distmats,[],2);
     Maskdata(navox)  = minmat; % from now on, the maskdata is not binary
     Maskdata(find(Maskdata>targetdepth))=0;
    TMSWriteNii(reshape(Maskdata,c6dim1,c6dim2,c6dim3),c6head(1,1),  [FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']);
     copyfile(  [FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii'],    [FCOutDir,filesep,subj,filesep,'Indi.nii']  );
    %%

%      Maskdata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii'], [FCOutDir,filesep,subj]  ); 
%      Maskdata(find(Maskdata))=1 ;% binray the mask 20221113 by jgj
       TMSreslice([Indipath,filesep,'fundata1tp.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii'], [FCOutDir,filesep,subj]  ); 
    

     TMSwriteDTL(MATdir,[FCOutDir,filesep,subj,filesep,'rIndiTargetMask.nii']) ;
     movefile([FCOutDir,filesep,subj,filesep,'wrIndiTargetMask.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask_MNI.nii']) ;
      
     delete([FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']) ;
     movefile([FCOutDir,filesep,subj,filesep,'rIndiTargetMask.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']) ;
     
     [Maskhead Maskdata]=TMSReadNii([FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']) ;
     Maskdata(find(Maskdata))=1 ; 
 
 % read seed signal
   size(Seeddata)
   Seeddata = reshape(Seeddata,dim1*dim2*dim3,1) ; 
   SeedSig = repmat(Seeddata,[1,size(fundata,2)]).*fundata ;
   SeedSignal = sum(SeedSig(find(Seeddata),:),1)/sum(Seeddata(find(Seeddata))) ;

 % calculate FC map
    fprintf('\n\tCalculating seed-based functional connectivity...\n');
    rValues=TMSfastCorr(SeedSignal',fundata');
    FCMap = reshape(rValues,dim1,dim2,dim3) ; %% NOT z transformed 
    mkdir([FCOutDir,filesep,subj]);
    TMSWriteNii(FCMap,funhead(1,1),[FCOutDir,filesep,subj,filesep, 'SeedFCinWB.nii']);
    TMSWriteNii(FCMap.*reshape(Maskdata,dim1,dim2,dim3),Maskhead,[FCOutDir,filesep,subj ,filesep,'SeedFCinROI.nii']);

    
    
    