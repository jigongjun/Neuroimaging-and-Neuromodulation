% function varargout =AFQTractValue(DTIdir,T1dir,ALFFdir,imgname)
function [wholebrainFG fg_clean FA MD RD AD] = AFQTractValue(DTIdir,T1dir,ALFFdir,imgname)

%% This funciton was initially written for evaluating the ALFF within each
%% tracts. But it also could extract other measures in any 3-D images, e.g., T1.nii   
%% Gong-Jun JI, 2020.3.26

%% example input
% DTIdir = '/home/NCPL09/Desktop/fMRItool/AFQ-VistaSoftware/jgjtest/DTIImg/subj'
% ALFFdir = '/home/NCPL09/Desktop/fMRItool/AFQ-VistaSoftware/jgjtest/FunImg/subj'
% T1dir = '/home/NCPL09/Desktop/fMRItool/AFQ-VistaSoftware/jgjtest/T1Img/subj'
% imgname = 'ALFF'
if nargin==2
    imgname=0;
    ALFFdir=[];
end

if ~exist([DTIdir,filesep,'TractRes'])
   mkdir ([DTIdir,filesep,'TractRes']) ;
end

%% Step 1: Whole-brain tractography. 
sub_dir = DTIdir;
% b0img = dir([DTIdir,filesep,'*_S0.nii*']) ;
% t1img = dir([T1dir,filesep,subj,filesep,'co*']) 
% t1img = dir([T1dir,filesep,'acpc_co*']) 

if exist([DTIdir,filesep,'dt6.mat'],'file')  
   dt = dtiLoadDt6([DTIdir,filesep,'dt6.mat']);
else
   dtiMakeDt6FromFsl([DTIdir,filesep,'dataBCF_S0.nii.gz'],...
                     [T1dir,filesep,'ac_coT1.nii.gz'],[DTIdir,filesep,'dt6.mat']); % this produce a '*_dt6.mat'
   dt = dtiLoadDt6(fullfile(DTIdir,filesep,'dt6.mat'));
end    

if ~exist([DTIdir,filesep,'TractRes',filesep,'wholebrainFG.mat'],'file') 
%    wholebrainFG = AFQ_WholebrainTractography(dt,'test');
   wholebrainFG = AFQ_WholebrainTractography(dt);
   save([DTIdir,filesep,'TractRes',filesep,'wholebrainFG.mat'],'wholebrainFG') ;
else
   load([DTIdir,filesep,'TractRes',filesep,'wholebrainFG.mat']) ;
end

%% Step 2: Fiber tract segmentation
% Segment the whole-brain fiber group into 20 fiber tracts
% This step make a ROIs folder
if exist ([DTIdir,filesep,'TractRes',filesep,'fg_clean.mat'],'file')
    FirstTracking = 1 ;
    load([DTIdir,filesep,'TractRes',filesep,'fg_clean.mat']);
else
   FirstTracking = 1 ;
   fg_class = AFQ_SegmentFiberGroups(dt, wholebrainFG);
   fg_classified = fg2Array(fg_class);

%% Step 3: Fiber tract cleaning
   maxDist = 4;   maxLen = 4;      M = 'mean';
   maxIter = 1;   count = true;
% Loop over all 20 fiber groups and clean each one
   for ii = 1:20
       fg_clean(ii) = AFQ_removeFiberOutliers(fg_classified(ii),...
                      maxDist,maxLen,100,M,count,maxIter);
   end
   save ([DTIdir,filesep,'TractRes',filesep,'fg_clean.mat'],'fg_clean') ;
end

%% Step 4: Compute tract profiles
 fprintf('\n\t Computing tract profiles...\n'); 
if imgname
if ~exist ([DTIdir,filesep,'TractRes',filesep,[imgname '.mat']],'file')
   alffimg = dir ([ALFFdir,filesep,[imgname '*']]) ; % only one image in the folder, such as ALFF.
   [ALFFdir,filesep,alffimg(1).name]
   niimg = niftiRead ([ALFFdir,filesep,alffimg(1).name]);
   [FlexM] = AFQ_ComputeTractProperties(fg_clean,niimg,100,1,sub_dir);
   save ([DTIdir,filesep,'TractRes',filesep,[imgname '.mat']],'FlexM') ;
end
end

if ~exist ([DTIdir,filesep,'TractRes',filesep,'FA.mat'],'file')
%    load ([DTIdir,filesep,'TractRes',filesep,'FA.mat'])
%    load ([DTIdir,filesep,'TractRes',filesep,'MD.mat'])
%    load ([DTIdir,filesep,'TractRes',filesep,'RD.mat'])
%    load ([DTIdir,filesep,'TractRes',filesep,'AD.mat'])
% else
   [FA MD RD AD CL Volume TractProfile] = AFQ_ComputeTractProperties(fg_clean,dt,100,1,sub_dir);

   save ([DTIdir,filesep,'TractRes',filesep,'FA.mat'],'FA') ;
   save ([DTIdir,filesep,'TractRes',filesep,'MD.mat'],'MD') ;
   save ([DTIdir,filesep,'TractRes',filesep,'RD.mat'],'RD') ;
   save ([DTIdir,filesep,'TractRes',filesep,'AD.mat'],'AD') ;
   save ([DTIdir,filesep,'TractRes',filesep,'CL.mat'],'CL') ;
   save ([DTIdir,filesep,'TractRes',filesep,'Volume.mat'],'Volume') ;
   save ([DTIdir,filesep,'TractRes',filesep,'TractProfile.mat'],'TractProfile') ;
 end
   



