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
   
   if ~exist([DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1B.nii'])
     MATdir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1.nii']; 
     invMatDir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'iy_ac_coT1.nii']; 
   else
       MATdir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1B.nii']; 
     invMatDir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'iy_ac_coT1B.nii'];
   end
   TMSreslice([Indipath,filesep,'fundata1tp.nii'],[DataDir,filesep,'T1Img',filesep,subjnew,filesep,'c4ac_coT1.nii'],[Indipath],2);  % just chg the c4 (edge) resolution, keep the dim
   [c4head c4data] =TMSReadNii([Indipath,filesep,'rc4ac_coT1.nii']);
   c4dim1=c4head.dim(1) ; c4dim2=c4head.dim(2) ; c4dim3=c4head.dim(3) ; 

   copyfile(SeedDir ,[Indipath,filesep,[Seedname sextn]]) ;
   TMSwriteDTL(invMatDir,[Indipath,filesep,[Seedname sextn]]) ;  % chg the seed to individual space
   Seeddata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],[Indipath,filesep,['w' Seedname sextn]],[Indipath]);  % seed image in fun space
   
   copyfile(FCMaskDir ,[Indipath,filesep,[Maskname mextn]]) ;
   TMSwriteDTL(invMatDir,[Indipath,filesep,[Maskname mextn]]) ; % chg the mask to individual space
   
%    if targetdepth==0
%           Maskdata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],[Indipath,filesep,['w' Maskname mextn]],[Indipath]);    % chg mask image to fun space
%           Maskdata(find(Maskdata))=1 ;
%           Maskdata = reshape(Maskdata,dim1*dim2*dim3,1);
% 
%    elseif targetdepth>0
        Maskdata=TMSreslice([Indipath,filesep,'rc4ac_coT1.nii'],[Indipath,filesep,['w' Maskname mextn]],[Indipath]);    % chg mask image to fun space
        Maskdata(find(Maskdata))=1 ;
        Maskdata = reshape(Maskdata,c4dim1*c4dim2*c4dim3,1);
       
      edghead = c4head;  edgdata = c4data;
      edgdata(find(edgdata<0.2))=0;
      TMSWriteNii(reshape(edgdata,edghead.dim(1),edghead.dim(2),edghead.dim(3)),edghead(1,1),[FCOutDir,filesep,subj,filesep,'edge.nii']);
      TMSwriteDTL(MATdir,[FCOutDir,filesep,subj,filesep,'edge.nii']) ;
      movefile([FCOutDir,filesep,subj,filesep,'wedge.nii'],[FCOutDir,filesep,subj,filesep,'edge_MNI.nii']) ;
%       edgdata=TMSreslice([Indipath,filesep,'rc4ac_coT1.nii'],[FCOutDir,filesep,subj,filesep,'edge.nii'],[FCOutDir,filesep,subj]);    % mask image in fun resolution, and c4 dimention
      edgdata = reshape(edgdata,c4dim1*c4dim2*c4dim3,1); 
  
      [navox nbvox] = find(Maskdata);
      size(navox)
      for i = 1  :  size(navox,1)
         [maskxyz(i,1) maskxyz(i,2) maskxyz(i,3)] = ind2sub([c4dim1 c4dim2 c4dim3],navox(i)) ;
      end
  
     [naedg nbedg] = find(edgdata>0);
     size(naedg)
     for i = 1  :  size(naedg,1)
        [edgxyz(i,1) edgxyz(i,2) edgxyz(i,3)] = ind2sub([c4dim1 c4dim2 c4dim3],naedg(i)) ;
     end
     distmats = pdist2( maskxyz,edgxyz); % point-by-point distance computation
     minmat = min(distmats,[],2);
     Maskdata(navox)  = minmat;
     Maskdata(find(Maskdata>targetdepth))=0;
     
     TMSWriteNii(reshape(Maskdata,c4dim1,c4dim2,c4dim3),c4head(1,1),[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']);
     Maskdata=TMSreslice([Indipath,filesep,'fundata1tp.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii'],[FCOutDir,filesep,subj]); 
     
     TMSwriteDTL(MATdir,[FCOutDir,filesep,subj,filesep,'rIndiTargetMask.nii']) ;
     movefile([FCOutDir,filesep,subj,filesep,'wrIndiTargetMask.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask_MNI.nii']) ;
      
     delete([FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']) ;
     movefile([FCOutDir,filesep,subj,filesep,'rIndiTargetMask.nii'],[FCOutDir,filesep,subj,filesep,'IndiTargetMask.nii']) ;
%    end
 
 % read seed signal
   Seeddata = reshape(Seeddata,dim1*dim2*dim3,1);
   SeedSig = repmat(Seeddata,[1,size(fundata,2)]).*fundata ;
   SeedSignal = sum(SeedSig(find(Seeddata),:),1)/sum(Seeddata(find(Seeddata))) ;

 % calculate FC map
    fprintf('\n\tCalculating seed-based functional connectivity...\n');
    rValues=TMSfastCorr(SeedSignal',fundata');
    FCMap = reshape(rValues,dim1,dim2,dim3) ; %% NOT z transformed 
    mkdir([FCOutDir,filesep,subj]);
    TMSWriteNii(FCMap,funhead(1,1),[FCOutDir,filesep,subj,filesep, 'SeedFCinWB.nii']);
    TMSWriteNii(FCMap.*reshape(Maskdata,dim1,dim2,dim3),funhead(1,1),[FCOutDir,filesep,subj ,filesep,'SeedFCinROI.nii']);

    
    
    