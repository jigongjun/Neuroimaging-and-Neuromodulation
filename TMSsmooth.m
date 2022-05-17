
%-----------------------------------------------------------------------
function TMSsmooth (imgdir,kernal)
s={} ;
v1=spm_vol(imgdir) ;

for i = 1 : length(v1)
    s{i,1} = [imgdir, ',' num2str(i)] ;
end
matlabbatch{1}.spm.spatial.smooth.data = s;
% {
%                                           'E:\test\FunImgARW\wra20160718_120112AUTISMliyuns004a1001_012.nii,1'
%                                           'E:\test\FunImgARW\wra20160718_120112AUTISMliyuns004a1001_013.nii,1'
%                                           };
matlabbatch{1}.spm.spatial.smooth.fwhm = [kernal kernal kernal];
matlabbatch{1}.spm.spatial.smooth.dtype = 0;
matlabbatch{1}.spm.spatial.smooth.im = 0;
matlabbatch{1}.spm.spatial.smooth.prefix = 's';
spm_jobman('run',matlabbatch)