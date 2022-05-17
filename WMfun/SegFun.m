

%% Take HOA to t1 space
analyfold = '/home/NCPL10/Desktop/Wanglu-scz/Cross_AHMU'

[TMSPath, fileN, extn] = fileparts(which('TMStarget.m'))
t1path = [analyfold,'/T1ImgNewSegment']
hoamask = [TMSPath '/mask/HOAsub25prob.nii'] ;
sublist = dir (t1path)  ;

for i = 3 : length(sublist)
%     cd ([t1path,filesep,sublist(i).name])
    matlist = dir ([t1path,filesep,sublist(i).name,filesep,'iy*.nii']) ;
    matnii = [t1path,filesep,sublist(i).name,filesep,matlist(1).name]
matlabbatch{1}.spm.spatial.normalise.write.subj.def = {matnii} ;
%{'/ewSegment/HC_caizhi/iy_coSYT1016vascular.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = {[hoamask ',1']};
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-90 -126 -72
                                                          90 90 108];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [3 3 3];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 0;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

spm_jobman('run',matlabbatch)

copyfile([TMSPath '/mask/wHOAsub25prob.nii'],...
[t1path,filesep,sublist(i).name,filesep,'wHOAsub25prob.nii'])  ;
end
delete ([TMSPath '/mask/wHOAsub25prob.nii']) ;

%% seg fun by t1 segmentation 
%% white matter
path1 = [analyfold, '/T1ImgNewSegment']
assesedfoldname =  'FunImgARCF'
path2 =  [analyfold,filesep,assesedfoldname ]
list1 = dir(path2)
GMSegThr=0.3 ; % probability threshold from segmentation
WMSegThr=0.9 ;

for i = 3 :  length(list1)
    imglist1 = dir ([path1,filesep,list1(i).name,filesep,'c2*.nii']) ;
    imglist2 = dir ([path2,filesep,list1(i).name,filesep,'*.nii']) ;
    [fun funvoxel funhead] = rest_readfile([path2,filesep,list1(i).name,...
        filesep,imglist2(1).name]) ;  
    [n1 n2 n3 n4] = size(fun)  ;
    
    rest_ResliceImage([path1,filesep,list1(i).name,...
        filesep,imglist1(1).name],...
        [path1,filesep,list1(i).name,...
        filesep,'rspl_' imglist1(1).name],...
        [n1 n2 n3],0,[path2,filesep,list1(i).name,...
        filesep,imglist2(1).name])  ;
    
    
   imglist3 = dir ([path1,filesep,list1(i).name,filesep,'rspl_c2*.nii']) ;
   [c2 c2voxel c2head] = rest_readfile([path1,filesep,list1(i).name,...
        filesep,imglist3(1).name]) ;
    c2(find(c2<WMSegThr))=0; c2(find(c2))=1;  % 0.9 propobility threshold
    
    rest_ResliceImage([path1,filesep,list1(i).name,filesep,'wHOAsub25prob.nii'],...
        [path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii'],...
        [n1 n2 n3],0,[path2,filesep,list1(i).name,filesep,imglist2(1).name])  ;
    [submask subvoxel subhead] = rest_readfile([path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii']) ;
    submask(find(submask==0))=1 ;  submask(find(submask>1))=0 ; 
    
    c2mask = c2.*submask ;
    
    mkdir([analyfold,filesep,assesedfoldname,'wm',filesep, list1(i).name])
    rest_Write4DNIfTI([repmat(c2mask,[1 1 1 n4]).*fun],funhead,...
       [analyfold,filesep,assesedfoldname,'wm',filesep,list1(i).name,filesep,list1(i).name '_WM.nii']);
end
    
%% gray matter

for i = 3 :  length(list1)
    imglist1 = dir ([path1,filesep,list1(i).name,filesep,'c1*.nii']) ;
    imglist2 = dir ([path2,filesep,list1(i).name,filesep,'*.nii']) ;
    [fun funvoxel funhead] = rest_readfile([path2,filesep,list1(i).name,...
        filesep,imglist2(1).name]) ;  
    [n1 n2 n3 n4] = size(fun)  ;
    
    rest_ResliceImage([path1,filesep,list1(i).name,...
        filesep,imglist1(1).name],...
        [path1,filesep,list1(i).name,...
        filesep,'rspl_' imglist1(1).name],...
        [n1 n2 n3],0,[path2,filesep,list1(i).name,...
        filesep,imglist2(1).name])  ;
    
    
   imglist3 = dir ([path1,filesep,list1(i).name,filesep,'rspl_c1*.nii']) ;
   [c2 c2voxel c2head] = rest_readfile([path1,filesep,list1(i).name,...
        filesep,imglist3(1).name]) ;
        c2(find(c2<GMSegThr))=0; c2(find(c2))=1;  % 0.3 propobility threshold
        
   [submask subvoxel subhead] = rest_readfile([path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii']) ;
     submask(find(submask))=1 ; 
    
    c2mask = c2+submask ;
    c2mask(find(c2mask))=1;
    mkdir([analyfold,filesep,assesedfoldname,'gm',filesep, list1(i).name])
    rest_Write4DNIfTI([repmat(c2mask,[1 1 1 n4]).*fun],funhead,...
       [analyfold,filesep,assesedfoldname,'gm',filesep,list1(i).name,filesep,list1(i).name '_GM.nii']);
end







%% produce group level GM and WM mask
%%
GMSegThr=0.3 ; % probability threshold from segmentation
WMSegThr=0.9 ;
GMGroupThr=0.3 ;  % probability threshold across subjects
WMGroupThr=0.9 ; 
p1 = [analyfold,'/T1ImgNewSegment']
list = dir (p1)

for i = 3 : length(list)
    img1 = dir([p1,filesep,list(i).name,filesep,'wc*.nii']) 
    [data1 voxel1 head1] = rest_readfile ([p1,filesep,list(i).name,filesep,img1(1).name]) ;
    [data2 voxel2 head2] = rest_readfile ([p1,filesep,list(i).name,filesep,img1(2).name]) ;
  datac1(:,:,:,i-2) = data1  ;
  datac2(:,:,:,i-2) = data2  ;
end

datac1 (find(datac1>GMSegThr)) = 1  ;
datac2 (find(datac2>WMSegThr)) = 1  ;
datac1 (find(datac1<1)) = 0  ;
datac2 (find(datac2<1)) = 0  ;
datac11 = sum (datac1,4)./size(datac1,4) ;
datac22 = sum (datac2,4)./size(datac1,4) ;
head1.dt=[8 0] ;
rest_WriteNiftiImage(datac11,head1,'GMProb.nii')  ;
rest_WriteNiftiImage(datac22,head1,'WMProb.nii')  ;

datac11 (find(datac11>GMGroupThr)) = 1 ;
datac22 (find(datac22>WMGroupThr)) = 1 ;
datac11 (find(datac11<1)) = 0 ;
datac22 (find(datac22<1)) = 0 ;
rest_WriteNiftiImage(datac11,head1,'GMProb90.nii')  ;
rest_WriteNiftiImage(datac22,head1,'WMProb90.nii')  ;



%% Combing GM and WM to a single brain
gmpath = '/home/NCPL09/Desktop/PDHC_WMfunciton/FunProcessingSupp/FunImgARgCgmWSF'
wmpath = '/home/NCPL09/Desktop/PDHC_WMfunciton/FunProcessingSupp/FunImgARgCwmWSF'
sub = dir (gmpath)
[wmdatam voxel head] = rest_readfile ('/home/NCPL09/Desktop/PDHC_WMfunciton/wmGroupMask')  ;
[gmdatam voxel head] = rest_readfile ('/home/NCPL09/Desktop/PDHC_WMfunciton/gmGroupMask')  ;

for i = 3 :  length(sub)
    img = dir ([gmpath,filesep,sub(i).name,filesep,'*.nii'])  ;
    [gmdata voxel head] = rest_readfile ([gmpath,filesep,sub(i).name,filesep,img(1).name]) ;
    [wmdata voxel head] = rest_readfile ([wmpath,filesep,sub(i).name,filesep,img(1).name]) ;
    gmdata2 = gmdata.*repmat(gmdatam,[1,1,1,size(gmdata,4)]) ;
    wmdata2 = wmdata.*repmat(wmdatam,[1,1,1,size(wmdata,4)]) ;
mkdir (['/home/NCPL09/Desktop/PDHC_WMfunciton/FunProcessingSupp/FunImgARgCWSF/' sub(i).name])
rest_Write4DNIfTI(gmdata2+wmdata2,head,...
    ['/home/NCPL09/Desktop/PDHC_WMfunciton/FunProcessingSupp/FunImgARgCWSF/' sub(i).name '/WBdata.nii']) ;
end

[AllVolume, Voxel, ImgFileList, Header, nVolumn] =rest_to4d(pwd) ;
  data=AllVolume;  
  data(find(data))=1;
  probdata = sum(data,4) ;
  [datasub voxel head ] = rest_readfile('HOAsub25probMask333.nii')  ;
  data2 = probdata  ;
  data2(find(data2<78))=0;
  data2(find(data2))=1;
  rest_WriteNiftiImage(data2,Header,'gmGroupMask.nii')
  
    