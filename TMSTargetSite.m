function TMSTargetSite(T1Dir,FunDir,subjID,PosNeg,VoxThr)
%% this function based on the FC maps

OutDir=FunDir ;
if strcmp(subjID(end-4:end-1),'_Run') 
    subjnew = subjID(1:end-5);
  else
    subjnew = subjID;
end

MATdir = [T1Dir,filesep,subjnew,filesep,'y_ac_coT1B.nii']; 
invMatDir = [T1Dir,filesep,subjnew,filesep,'iy_ac_coT1B.nii'] 
[fcheadMNI fcdataMNI] = TMSReadNii([FunDir,filesep,subjID,filesep,'SeedFCinROI_MNI.nii']) ; %MNI space

dim1 =  fcheadMNI.dim(1); dim2 =fcheadMNI.dim(2); dim3=fcheadMNI.dim(3);
 size(PosNeg,2)
for dirN = 1 : size(PosNeg,2)      
%% save the most positive point
if PosNeg{dirN}=='Positive'
   FCMapP=fcdataMNI; 
   FCMapP(find(FCMapP<max(fcdataMNI)))=0 ;
   [MatX MatY MatZ]=ind2sub(size(reshape(FCMapP,dim1,dim2,dim3)),find(FCMapP==max(FCMapP))) ;
   MatrixCenter=[MatX(1) MatY(1) MatZ(1)];

   MNICenter = TMSmat2mni(MatrixCenter,fcheadMNI.mat);
   TMSsphereROI (MNICenter,5,[OutDir,filesep,subjID],[FunDir,filesep,subjID,filesep,'SeedFCinROI_MNI.nii']) ;  %%%
   movefile([OutDir,filesep,subjID,filesep,'SphereROI2.nii'],[OutDir,filesep,subjID,filesep,'StiTargetPosiPt_MNI.nii']) ;
   MNICenter_t = [MNICenter max(fcdataMNI)] ;
   save([OutDir,filesep,subjID,filesep,'MNICoordinate_PosiPt.txt'],'MNICenter_t','-ascii') ;
   TMSwriteDTL(invMatDir,[OutDir,filesep,subjID,filesep,'StiTargetPosiPt_MNI.nii']) ; % convert the MNI target to T1 space
   TMSreslice([T1Dir,filesep,subjnew,filesep,'ac_coT1.nii'],[OutDir,filesep,subjID,filesep,'wStiTargetPosiPt_MNI.nii'],[OutDir,filesep,subjID]) ;
   delete([OutDir,filesep,subjID,filesep,'wStiTargetPosiPt_MNI.nii']) ;
   movefile([OutDir,filesep,subjID,filesep,'rwStiTargetPosiPt_MNI.nii'],[OutDir,filesep,subjID,filesep,'StiTargetPosiPt_T1Sp.nii']) ;
   delete([OutDir,filesep,subjID,filesep,'SphereROI1.nii']) ;

   
%% save the most negative point
elseif PosNeg{dirN}=='Negative'
   FCMapN = fcdataMNI; 
   FCMapN(find(FCMapN>min(fcdataMNI)))=0 ;
   [MatX MatY MatZ]=ind2sub(size(reshape(FCMapN,dim1,dim2,dim3)),find(FCMapN==min(FCMapN))) ;
   MatrixCenter=[MatX(1) MatY(1) MatZ(1)];

   MNICenter = TMSmat2mni( MatrixCenter,fcheadMNI.mat);
   TMSsphereROI (MNICenter,5,[OutDir,filesep,subjID],[FunDir,filesep,subjID,filesep,'SeedFCinROI_MNI.nii']) ;
   movefile([OutDir,filesep,subjID,filesep,'SphereROI2.nii'],[OutDir,filesep,subjID,filesep,'StiTargetNegaPt_MNI.nii']) ;
   MNICenter_t = [MNICenter min(fcdataMNI)] ;
   save([OutDir,filesep,subjID,filesep,'MNICoordinate_NegaPt.txt'],'MNICenter_t','-ascii') ;
   TMSwriteDTL(invMatDir,[OutDir,filesep,subjID,filesep,'StiTargetNegaPt_MNI.nii']) ; % convert the MNI target to T1 space
   TMSreslice([T1Dir,filesep,subjnew,filesep,'ac_coT1.nii'],[OutDir,filesep,subjID,filesep,'wStiTargetNegaPt_MNI.nii'],[OutDir,filesep,subjID]) ;
   delete([OutDir,filesep,subjID,filesep,'wStiTargetNegaPt_MNI.nii']) ;
   movefile([OutDir,filesep,subjID,filesep,'rwStiTargetNegaPt_MNI.nii'],[OutDir,filesep,subjID,filesep,'StiTargetNegaPt_T1Sp.nii']) ;
   delete([OutDir,filesep,subjID,filesep,'SphereROI1.nii']) ;
end
end
%% define the target using voxel p and cluster size
      
for dirN = 1 : size(PosNeg,2)    
     OutDirSubj=[FunDir,filesep,subjID];
     TMSLargeCluster([OutDirSubj,filesep,'SeedFCinROI.nii'],VoxThr,PosNeg{dirN}) ;  % individual space
     
     if exist([OutDirSubj,filesep,'FCinROICt.nii'],'file')  % in case of no voxel survive the threshold
          
       TMSwriteDTL(MATdir,[OutDirSubj,filesep,'FCinROICt.nii']) ; % transform to MNI space
        movefile([OutDirSubj,filesep,'FCinROICt.nii'],[OutDirSubj,filesep,['FCinROI' PosNeg{dirN}(1:4) 'LCt.nii']]);
       movefile([OutDirSubj,filesep,'wFCinROICt.nii'],[OutDirSubj,filesep,['FCinROI' PosNeg{dirN}(1:4) 'LCt_MNI.nii']]) ;
      
     MNICenterL=TMSMNICenter([OutDirSubj,filesep,['FCinROI' PosNeg{dirN}(1:4) 'LCt_MNI.nii']]) ;
     save([OutDirSubj,filesep,['MNICoordinate_' PosNeg{dirN}(1:4) 'LCt.txt']],'MNICenterL','-ascii') ;
      
     TMSsphereROI (MNICenterL,8,[OutDir,filesep,subjID],[FunDir,filesep,subjID,filesep,'SeedFCinROI_MNI.nii']) ;
     movefile([OutDirSubj,filesep,'SphereROI2.nii'],[OutDirSubj,filesep,['StiTarget' PosNeg{dirN}(1:4) 'LCt_MNI.nii']]);
     
     TMSwriteDTL(invMatDir,[OutDirSubj,filesep,['StiTarget' PosNeg{dirN}(1:4) 'LCt_MNI.nii']]) ; % convert the MNI target to T1 space
     TMSreslice([T1Dir,filesep,subjnew,filesep,'ac_coT1.nii'],[OutDirSubj,filesep,['wStiTarget' PosNeg{dirN}(1:4) 'LCt_MNI.nii']],[OutDirSubj]) ;
     delete([OutDirSubj,filesep,['wStiTarget' PosNeg{dirN}(1:4) 'LCt_MNI.nii']]) ;
     movefile([OutDirSubj,filesep,['rwStiTarget' PosNeg{dirN}(1:4) 'LCt_MNI.nii']],[OutDirSubj,filesep,['StiTarget'  PosNeg{dirN}(1:4)  'LCt_T1Sp.nii']]) ;
     delete([OutDirSubj,filesep,'SphereROI1.nii']) ;
     end
end
      
      
      