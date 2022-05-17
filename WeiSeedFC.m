function FCMap = WeiSeedFC(SeedDir,FCMaskDir,FCOutDir,AnalysisDir,subj,targetdepth)
%% in this weighted FC, the values of the seed mask is used to compute the seed signal 

if nargin<5
        error(' Error using ==> at least 5 arguments wanted.');
     elseif nargin==5    
       targetdepth = 0              % number of voxels, distance from cortical target to c4
    elseif nargin>6
        error('Error using ==> Too many input');
end

  MATdir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1.nii']; 
  invMatDir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'iy_ac_coT1.nii']; 


mkdir([FCOutDir,filesep,subj]);
[SeedPath, Seedname, sextn] = fileparts(SeedDir);
[MaskPath, Maskname, mextn] = fileparts(FCMaskDir);
[DataDir,inifd,cc] = fileparts (AnalysisDir) ;
[funhead fundata] = TMSReadNii([DataDir,filesep,inifd,filesep,subj,filesep,'fundata.nii']) ;
dim1 = funhead(1,1).dim(1); dim2=funhead(1,1).dim(2); dim3=funhead(1,1).dim(3);

   Indipath = [DataDir,filesep,'IndiMasks',filesep,subj] ;
   if ~exist (Indipath,'dir')
       xfolder = dir([DataDir,filesep,'IndiMasks',filesep,[subj '_Run*']] ) ;
       Indipath = [DataDir,filesep,'IndiMasks',filesep,xfolder(1).name] ;
   end
   
   if strcmp(subj(end-4:end-1),'_Run') 
      subjnew = subj(1:end-5);
   else
      subjnew = subj;
   end
   
   copyfile(SeedDir , [Indipath,filesep,[Seedname sextn]]) ;
   TMSwriteDTL(invMatDir,[Indipath,filesep,[Seedname sextn]]) ;
   Seeddata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],[Indipath,filesep,['w' Seedname sextn]],[Indipath]);  % seed image in fun space
   
   [tmspath,b,c] = fileparts(which('TMSTarget.m'));
   copyfile([tmspath,filesep,'mask',filesep,'GreyMask20.nii'], [Indipath,filesep,'GreyMask20.nii']) ;
   TMSwriteDTL(invMatDir,[Indipath,filesep,'GreyMask20.nii']) ;
   gmdata = TMSreslice([Indipath,filesep,'fundata1tp.nii'],[Indipath,filesep,'wGreyMask20.nii'],[Indipath]); 
   Seeddata = Seeddata.*gmdata;
   
   copyfile(FCMaskDir ,[Indipath,filesep,[Maskname mextn]]) ;
   TMSwriteDTL(invMatDir,[Indipath,filesep,[Maskname mextn]]) ;
   Maskdata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],[Indipath,filesep,['w' Maskname mextn]],[Indipath]);    % mask image in fun space
   Maskdata(find(Maskdata))=1 ;
   Maskdata = reshape(Maskdata,dim1*dim2*dim3,1);
   
   %% identify voxels near the cortex surface
   if targetdepth>0
      c4Dir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c4ac_coT1.nii']; 
      edgdata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],c4Dir,[Indipath]);  % seed image in fun space
      edgdata(find(edgdata<0.2))=0;
      TMSWriteNii(edgdata,funhead(1,1),[FCOutDir,filesep,subj,filesep,'edge.nii']);
      TMSwriteDTL(MATdir,[FCOutDir,filesep,subj,filesep,'edge.nii']) ;
      movefile([FCOutDir,filesep,subj,filesep,'wedge.nii'],[FCOutDir,filesep,subj,filesep,'edge_MNI.nii']) ;
      edgdata = reshape(edgdata,dim1*dim2*dim3,1); 
  
      [navox nbvox] = find(Maskdata);
      size(navox)
      for i = 1  :  size(navox,1)
         [maskxyz(i,1) maskxyz(i,2) maskxyz(i,3)] = ind2sub([dim1 dim2 dim3],navox(i)) ;
      end
  
     [naedg nbedg] = find(edgdata);
     size(naedg)
     for i = 1  :  size(naedg,1)
        [edgxyz(i,1) edgxyz(i,2) edgxyz(i,3)] = ind2sub([dim1 dim2 dim3],naedg(i)) ;
     end
     distmats = pdist2( maskxyz,edgxyz); % point-by-point distance computation
     minmat = min(distmats,[],2);
     Maskdata(navox)  = minmat;
     Maskdata(find(Maskdata>targetdepth))=0; % 7 indicating  7*3 cm
  
     TMSWriteNii(reshape(Maskdata,dim1,dim2,dim3),funhead(1,1),[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']);
     TMSwriteDTL(MATdir,[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']) ;
      movefile([FCOutDir,filesep,subj,filesep,'wIndiTargetMask.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask_MNI.nii']) ;
      Maskdata(find(Maskdata))=1 ;
   end
   
   %%
 % read 4d Preprocessed data
   Seeddata = repmat(reshape(seeddata,dim1*dim2*dim3,1),[1,size(fundata,2)]);
   SeedSig = Seeddata.*fundata ;
   SeedSignal = sum(SeedSig(find(Seeddata),:),1)./sum(SeedSig(find(Seeddata),:),1) ;
   
   % calculate FC map
    fprintf('\n\tCalculating seed-based functional connectivity...\n');
    rValues=TMSfastCorr(SeedSignal',fundata');
    FCMap = reshape(rValues,dim1,dim2,dim3) ;
    mkdir([FCOutDir,filesep,subj]);
    TMSWriteNii(FCMap,funhead(1,1),[FCOutDir,filesep,subj,filesep, 'SeedFCinWB.nii']);
    TMSWriteNii(FCMap.*reshape(Maskdata,dim1,dim2,dim3),funhead(1,1),[FCOutDir,filesep,subj ,filesep,'SeedFCinROI.nii']);

    
    
    