 function TMSTPCalc
% Written by Dr. Gong-Jun JI, jigongjun@163.com, Anhui Medical University

inpath = spm_select(1,'dir') 
outpath = spm_select(1,'dir') 

list = dir (inpath);

for i = 3 : length(list)
    img=dir([inpath,filesep,list(i).name,filesep,'*.nii'])  ;
    head = spm_vol([inpath,filesep,list(i).name,filesep,img(1).name]) ;
%     [data xyz] =spm_read_vols(head) ;
    TP(:,i-2) = size(head,1)  ;
end
save( [outpath,filesep,'TPlength.txt'], 'TP', '-ascii') ;