function TMSDicomConvert(DicomDir,NiiDir)
[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'));
DicomDir
NiiDir
 if ispc
          eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii.exe '],...
          [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii.ini'],...
          [' -o ',NiiDir,' ',DicomDir]]);
       else
          eval(['!chmod +x ' ProgramPath,filesep,'DCM2NII',filesep,'dcm2nii_linux'])
          eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii_linux '],...
               [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii_linux.ini'],...
               [' -o ',NiiDir,' ',DicomDir]]);
 end