function TMSRealign (DataDir)
TemImg = dir([DataDir,filesep,'*.nii'])  ;

for i = 1  : length(TemImg)
TempScan(i,1)= {[DataDir,filesep,TemImg(i).name ',1'] } ;
end
matlabbatch{1}.spm.spatial.realign.estimate.data = {TempScan} ;

% matlabbatch{1}.spm.spatial.realign.estimate.data = 
% {
%                                                     {
%                                                     'E:\FunImg\20160718_120112AUTISMliyuns004a1001_215.nii,1'
%                                                     'E:\FunImg\20160718_120112AUTISMliyuns004a1001_216.nii,1'
%                                                     'E:\FunImg\20160718_120112AUTISMliyuns004a1001_217.nii,1'
%                                                     }
%                                                     }';
%%
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.quality = 0.9;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.sep = 4;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.fwhm = 5;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.rtm = 1;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.interp = 2;
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estimate.eoptions.weight = '';
spm_jobman('run',matlabbatch)