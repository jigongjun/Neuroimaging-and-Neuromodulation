function MaskSignal = TMSextract (DataDir,MaskDir)  
% DataDir - folder containing nii images. e.g. D:\test
% MaskDir - image dir. e.g. D:\gray.nii

  MaskHeader = spm_vol(MaskDir) ;
 [MaskVol,MaskXYZ] = spm_read_vols(MaskHeader)  ;
  

[patha b c] = fileparts(DataDir);
if c=='.nii'
   ImgHeader = spm_vol(DataDir) ;
   [ImgVol,ImgXYZ] = spm_read_vols(ImgHeader)  ;
   ImgVol(isnan(ImgVol))=0;
   MaskValue = MaskVol.*ImgVol;
   MaskSignal(:,1) = mean(MaskValue(find(MaskValue))); 
    
else
    MaskVol = reshape(MaskVol,[],1) ;
   ImgList = dir([DataDir,filesep,'*.nii']) ;
   ImgHeader = spm_vol([DataDir,filesep,ImgList(1).name]) ;
   [ImgVol,ImgXYZ] = spm_read_vols(ImgHeader)  ;   
   Vol4d(:,:,:,1) = ImgVol ;
   fprintf('\n\tProducing 4D data...\n');
    for i = 1  : length(ImgList)
        ImgHeader = spm_vol([DataDir,filesep,ImgList(i).name]) ;
        [ImgVol,ImgXYZ] = spm_read_vols(ImgHeader)  ;
        Vol4d(:,:,:,i) = ImgVol ;
        fprintf('.');
    end 
    [dim1 dim2 dim3 dim4] =  size(Vol4d)  ;
    Vol4d = reshape(Vol4d,[],dim4) ;
    
  
  for i = 1  : dim4
      MaskValue = MaskVol.*Vol4d(:,i);
      MaskSignal(i,1) = mean(MaskValue(find(MaskValue))); 
  end
end
 



