function TMScoregister (RefData,SouData,OtherData)
s={} ;
v1=spm_vol(OtherData) ;

for i = 1 : length(v1)
    s{i,1} = [OtherData, ',', num2str(i)] ;
end

matlabbatch{1}.spm.spatial.coreg.estimate.ref = {[RefData ',1']} ; %{'D:\fMRITool\TMStarget\template\ch2.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estimate.source ={[SouData ',1']} ;  % {'D:\fMRITool\TMStarget\template\coSCZ0808.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estimate.other = s;
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
spm_jobman('run',matlabbatch)
