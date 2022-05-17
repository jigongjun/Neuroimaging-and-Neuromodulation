function TractMS2Nii(ng1,ng2)

%% This function will 
%% 1) summary the tract measures of all subjects into a single mat file
%% 2) idetify and exclude subjects who failed in tracking all 18 bundles
%% 3) translate the data containing eligiable subjects into nii.gz images
%% This is an necessory process before performing Randomise analsyis

%% input: 
% 1. # of each group. two groups in default
% 2. output folder
% 3. txt file contain subj names
% 4. folder with DTI result of each subjects

%% output
% 1. txt file contain eligiable subjects name
% 2. one nii.gz image for each subjects, and a 4D image, termed 'merged4d.nii.gz'
% 3. a mask.nii.gz for statistical analysis

%% By Gong-Jun Ji, 20200526, Hefei
%%
[wmpath a b] = fileparts(which('WhiteMatter'))
outdir= uigetdir([],'select a output folder') ;
[subjtxtname txtpath cc] = uigetfile('*.txt','txt file contain subj names');
subj = importdata([txtpath subjtxtname]) ;

DTIdir = uigetdir([],'Select the folder with DTI result folder') ;
WMms = inputdlg('Select one measure, e.g., mALFF') ;

cd([DTIdir]) ;
    for i = 1 : length(subj)
        FlexM = importdata([subj{i},filesep,'TractRes',filesep,[WMms{1} '.mat']]) ;
        TractMS(:,:,i)= FlexM;
    end


%% excluding subjects failed in tracking fibers
TractMS(:,19:20,:)=[];  % excluding the 19th, 20th bundles
[inda indb] = find(isnan(mean(squeeze(mean(TractMS)))));
if size(indb,2)
fprintf('\nSome bundles were not successfully tracked in these subjects...\n'); 
for n = 1  : size(indb,2)
   disp(subj{indb(n)}) ;
end
fprintf('They will be excluded from following analysis\n'); 
end

newTractMS = TractMS ;
newTractMS(:,:,indb)=[];  % renew the data and sample size 
if size(find(indb<=ng1),2)
   newng1 = ng1-size(find(indb<=ng1),2) 
end
if size(find(indb>ng1),2)
   newng2 = ng2-size(find(indb>ng1),2) 
else
    newng2=ng2
end

%% show the relative difference between groups
AFQplot(newng1,newng2,newTractMS);

%% convert the Tract measures into nii.gz images
cd([outdir]) ;
save('newTractMS.mat','newTractMS');

for i = 1 : ng1+ng2
    if ~ismember(i,indb)
    data=zeros(10000,100) ;
    data(101:4:172,:) = TractMS(:,:,i)' ;
    save('data','data','-ascii')
    cmd = cat(2, 'sh ', [wmpath,filesep], 'txt2nii.sh');
    system(cmd) ;
    movefile('tempimg.nii.gz',[subj{i} '.nii.gz']) ;
    end
end
delete ('data')

    cmd = cat(2, 'sh ', [wmpath,filesep], 'TMSmerge.sh');
    system(cmd) ;
    ListSubj(outdir); % list the subjects that entered the stat analysis
 
%% produce the mask for analysis     
    data=zeros(10000,100) ;
    data(101:4:172,:) = 1 ;
    save('mask.nii','data','-ascii')



