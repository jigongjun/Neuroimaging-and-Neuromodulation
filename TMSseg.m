%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
function TMSseg(T1dir) 
matlabbatch{1}.spm.spatial.preproc.data = {T1dir};
matlabbatch{1}.spm.spatial.preproc.output.GM = [1 0 0];
matlabbatch{1}.spm.spatial.preproc.output.WM = [0 0 0];
matlabbatch{1}.spm.spatial.preproc.output.CSF = [0 0 0];
matlabbatch{1}.spm.spatial.preproc.output.biascor = 1;
matlabbatch{1}.spm.spatial.preproc.output.cleanup = 0;
[path b c] = fileparts(which('TMStarget')) ;
matlabbatch{1}.spm.spatial.preproc.opts.tpm = {
                                               [path,filesep,'template',filesep,'tpm',filesep,'grey.nii']
                                               [path,filesep,'template',filesep,'tpm',filesep,'white.nii']
                                               [path,filesep,'template',filesep,'tpm',filesep,'csf.nii']
                                               };
matlabbatch{1}.spm.spatial.preproc.opts.ngaus = [2
                                                 2
                                                 2
                                                 4];
matlabbatch{1}.spm.spatial.preproc.opts.regtype = 'mni';
matlabbatch{1}.spm.spatial.preproc.opts.warpreg = 1;
matlabbatch{1}.spm.spatial.preproc.opts.warpco = 25;
matlabbatch{1}.spm.spatial.preproc.opts.biasreg = 0.0001;
matlabbatch{1}.spm.spatial.preproc.opts.biasfwhm = 60;
matlabbatch{1}.spm.spatial.preproc.opts.samp = 3;
matlabbatch{1}.spm.spatial.preproc.opts.msk = {''};
spm_jobman('run',matlabbatch)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
