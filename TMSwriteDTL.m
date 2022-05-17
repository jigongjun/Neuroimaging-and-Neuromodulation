%-----------------------------------------------------------------------
% Job saved on 29-Aug-2017 13:31:07 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
function TMSwriteDTL(MATdir,ImgDir,vsize) 
s={} ;
v1=spm_vol(ImgDir) ;

for i = 1 : length(v1)
    s{i,1} = [ImgDir, ',', num2str(i)] ;
end

if nargin==2
    vsize = [3 3 3];
end
matlabbatch{1}.spm.spatial.normalise.write.subj.def ={MATdir} ;                    %{'E:\liutingting\y_inverse.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = s  ;     %{'E:\liutingting\grey.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-90 -126 -72
                                                          90 120 108];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = vsize;
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 0;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';
spm_jobman('run',matlabbatch)


