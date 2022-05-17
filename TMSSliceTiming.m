
%-----------------------------------------------------------------------
function TMSSliceTiming(TempScan,TR,Order,Ref)
% TemImg = dir([DataDir,filesep,'*.nii'])  ;
% for i = 1  : length(TemImg)
% TempScan(i,1)= {[DataDir,filesep,TemImg(i).name ',1'] } ;
% end
s={} ;
v1=spm_vol(TempScan) ;

for i = 1 : length(v1)
    s{i,1} = [TempScan, ',', num2str(i)] ;
end

matlabbatch{1}.spm.temporal.st.scans = {s} ;
% matlabbatch{1}.spm.temporal.st.scans ={                                      {'E:\FunImg\20160718_120112AUTISMliyuns004a1001_215.nii,1'
%                                         'E:\FunImg\20160718_120112AUTISMliyuns004a1001_216.nii,1'
%                                         'E:\FunImg\20160718_120112AUTISMliyuns004a1001_217.nii,1'
%                                         }
%                                         }';
% %%
matlabbatch{1}.spm.temporal.st.nslices = max(Order)
matlabbatch{1}.spm.temporal.st.tr = TR;
matlabbatch{1}.spm.temporal.st.ta = TR-TR/max(Order)
matlabbatch{1}.spm.temporal.st.so = Order
% matlabbatch{1}.spm.temporal.st.so = [1 3 5 7 9 11 13 15 17 28 30 32 34 36 38 40 42 44 46];
matlabbatch{1}.spm.temporal.st.refslice = Ref
matlabbatch{1}.spm.temporal.st.prefix = 'a';
spm_jobman('run',matlabbatch)


