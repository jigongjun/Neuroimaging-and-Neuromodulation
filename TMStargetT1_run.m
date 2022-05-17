function TMStargetT1_run (T1Dir,ROIDir,MatDir,OutDire)
%   TMStarget GUI by Gong-Jun JI
%-----------------------------------------------------------
%	Copyright(c) 2016; GNU GENERAL PUBLIC LICENSE
%	Laboratory of Cognitive Neuropsychology, Department of Medical Psychology, Anhui Medical University
%   Written by Gong-Jun JI
%
%% OutDir - the directory of output
%% T1Dir - the directory of T1 image in native space
%% ROIDir - the directory of target in MNI space
%%

 mkdir([OutDire,filesep,'Results'])
 cd([OutDire,filesep,'Results']);
 OutDir=[OutDire,filesep,'Results'] ;
 if ispc
     colist =  dir ([T1Dir,filesep,'co*.nii'])
  copyfile ([T1Dir,filesep,colist(1).name],OutDir);
 else
    colist =  dir ([T1Dir,filesep,'co*.nii.gz']);
    gunzip([T1Dir,filesep,colist(1).name]);
    copyfile ([T1Dir,filesep,colist(1).name(1:end-3)],OutDir);
 end
 colist =  dir ([OutDir,filesep,'co*.nii']);
 
  if size(MatDir)>0
     INVdir = MatDir ;
     [tpath b c] = fileparts(which('TMStarget')) ;
  else
      [tpath b c] = fileparts(which('TMStarget')) ;
      RefData = [tpath,filesep,'template',filesep,'ch2.nii'] ;
      TMScoregister (RefData,[OutDir,filesep,colist(1).name],{''}) ;
      TMSseg([OutDir,filesep,colist(1).name]);
     INV= dir([OutDir,filesep,'*inv_sn.mat']) ;
     INVdir = [OutDir,filesep,INV.name] ;
  end
  
  [ROIpath, ROIfname, ROIextension] = fileparts(ROIDir);
  copyfile(ROIDir(1:end-2),[OutDir,filesep,ROIfname,ROIextension(1:end-2)]);
  TMSwrite(INVdir,{[OutDir,filesep,ROIfname,ROIextension]}) ;
  TMSreslice([OutDir,filesep,colist(1).name],[OutDir ,filesep, 'w' ROIfname '.nii'],OutDir);
   
  copyfile([tpath,filesep,'template',filesep,'tpm',filesep,'grey333.nii'],OutDir)
  TMSwrite(INVdir,{[OutDir,filesep,'grey333.nii,1']}) ; % For checking inverse quality
  
delete([OutDir,filesep,'grey333.nii']);
delete ([OutDir,filesep,ROIfname,ROIextension(1:end-2)]) ;  
fprintf('Individulized Target Image has been generated \n')

 
 