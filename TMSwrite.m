%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
function TMSwrite(MATdir,ROIlist) 
ROIlist;
matlabbatch{1}.spm.spatial.normalise.write.subj.matname = {MATdir} %{'D:\fMRITool\TMStarget\coSYT0928_seg_inv_sn.mat'}
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = ROIlist %{'D:\fMRITool\TMStarget\AAL.nii,1'}
matlabbatch{1}.spm.spatial.normalise.write.roptions.preserve = 0;
matlabbatch{1}.spm.spatial.normalise.write.roptions.bb = [-90 -126 -72
                                                          90 90 108];
matlabbatch{1}.spm.spatial.normalise.write.roptions.vox = [3 3 3];
matlabbatch{1}.spm.spatial.normalise.write.roptions.interp = 0;
matlabbatch{1}.spm.spatial.normalise.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.normalise.write.roptions.prefix = 'w';
spm_jobman('run',matlabbatch)