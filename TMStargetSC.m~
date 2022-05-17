function varargout = TMStargetSC(varargin)
% TMSTARGETSC M-file for TMStargetSC.fig
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TMStargetSC

% Last Modified by GUIDE v2.5 08-Nov-2020 22:38:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TMStargetSC_OpeningFcn, ...
                   'gui_OutputFcn',  @TMStargetSC_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TMStargetSC is made visible.
function TMStargetSC_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for TMStargetSC
handles.output = hObject;

set(handles.figure1,'outerposition',[8 1 90 40],'unit','normalized','color',[0.94 0.94 0.94])
movegui(hObject,'center')

set(handles.text1,'string','Producing Target by Structural Connectivity','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',16,'FontWeight','bold','unit','normalized','pos',[0.1 0.94 0.8 0.04])
set(handles.editDTIDir,'backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.24 0.86 0.68 0.05])
set(handles.psbDTIDir,'string','Data dir','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.08 0.86 0.15 0.055])

set(handles.uipanel4,'Title','Structural data','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',12,'unit','normalized','pos',[0.08 0.7 0.84 0.14])
set(handles.uipanel6,'title','Functional data','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',12,'unit','normalized','pos',[0.08 0.1 0.84 0.56])

set(handles.ckbSCT12NII,'string','DCM2NII','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.08 0.45 0.3 0.3])
set(handles.ckbSCT1BET,'string','BET','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.55 0.45 0.3 0.3])

set(handles.ckbSCDCM2NII,'string','DCM2NII','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.08 0.85 0.3 0.1])
set(handles.ckbEC,'string','Eddy Correction','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.08 0.74 0.4 0.1])
set(handles.ckbSCT12FA,'string','Coregistration','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.08 0.63 0.4 0.1])
set(handles.ckbBET,'string','BET','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.55 0.85 0.4 0.1])
set(handles.ckbDTIFIT,'string','Tensor Fitting','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.55 0.74 0.4 0.1])
set(handles.ckbBED,'string','Bayesian Estimation','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.55 0.63 0.4 0.1])

set(handles.ckbPROBTRACKX,'string','Probabilistic Tracking','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',12,'unit','normalized','pos',[0.08 0.4 0.4 0.1])
set(handles.phbSCSeedDir,'string','Seed Image','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.08 0.26 0.25 0.1])
set(handles.phbSCTargetDir,'string','Target Image','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.08 0.14 0.25 0.1])
set(handles.edtSCSeedDir,'backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.34 0.26 0.6 0.09])
set(handles.edtSCTargetDir,'backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.34 0.14 0.6 0.09])
set(handles.rdbMNIspace,'string','MNI Space','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.5 0.4 0.2 0.09])
set(handles.rdbNativeSpace,'string','Native Space','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.7 0.4 0.25 0.09])

set(handles.phbSCRun,'string','RUN','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',12,'unit','normalized','pos',[0.82 0.04 0.1 0.05])


% Update handles structure
guidata(hObject, handles);








% --- Outputs from this function are returned to the command line.
function varargout = TMStargetSC_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



% --- Executes on button press in ckbSCDCM2NII.
function ckbSCDCM2NII_Callback(hObject, eventdata, handles)
function ckbEC_Callback(hObject, eventdata, handles)


function editDTIDir_Callback(hObject, eventdata, handles)
function editDTIDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ckbPROBTRACKX_Callback(hObject, eventdata, handles)
function edtSCSeedDir_Callback(hObject, eventdata, handles)
function edtSCSeedDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtSCTargetDir_Callback(hObject, eventdata, handles)
function edtSCTargetDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ckbDTIFIT_Callback(hObject, eventdata, handles)
function ckbBED_Callback(hObject, eventdata, handles)
function ckbSCT12NII_Callback(hObject, eventdata, handles)
% --- Executes on button press in rdbMNIspace.
function rdbMNIspace_Callback(hObject, eventdata, handles)
function rdbNativeSpace_Callback(hObject, eventdata, handles)
function ckbSCT12FA_Callback(hObject, eventdata, handles)
function ckbSCT1BET_Callback(hObject, eventdata, handles)


        




% --- Executes on button press in phbSCSeedDir.
function phbSCSeedDir_Callback(hObject, eventdata, handles)
SCSeedDir =pwd;
	SCSeedDir = spm_select(1,'image','please the mask image in MNI space,*.nii')
    if ischar(SCSeedDir),
		set(handles.edtSCSeedDir,'String',SCSeedDir)
    end
    guidata(hObject, handles);


% --- Executes on button press in phbSCTargetDir.
function phbSCTargetDir_Callback(hObject, eventdata, handles)
SCTargetDir =pwd;
	SCTargetDir = spm_select(1,'image','please the mask image in MNI space,*.nii')
    if ischar(SCTargetDir),
		set(handles.edtSCTargetDir,'String',SCTargetDir)
    end
    guidata(hObject, handles);


% --- Executes on button press in psbDTIDir.
function psbDTIDir_Callback(hObject, eventdata, handles)
DTIDir =pwd;
	DTIDir = spm_select(1,'dir','please the folder contain DTIRaw subfolder')
    if ischar(DTIDir),
		set(handles.editDTIDir,'String',DTIDir)
    end
    guidata(hObject, handles);
    
    function ckbBET_Callback(hObject, eventdata, handles)



% --- Executes on button press in phbSCRun.
function phbSCRun_Callback(hObject, eventdata, handles)
DataDir = get( handles.editDTIDir,'String');
[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'))
%% DTIRaw to DTIImg
if get(handles.ckbSCDCM2NII,'value')
   
   mkdir([DataDir,filesep,'DTIImg']);
    if ispc
        eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii.exe '],...
       [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii.ini'],...
       [' -o ',DataDir,filesep,'DTIImg'],' ',[DataDir,filesep,'DTIRaw']]);
    else
       eval(['!chmod +x ' ProgramPath,filesep,'DCM2NII',filesep,'dcm2nii_linux'])
       eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii_linux '],...
       [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii_linux.ini'],...
       [' -o ',DataDir,filesep,'DTIImg'],' ',[DataDir,filesep,'DTIRaw']]);
   end
end

%% Exctracting brain issues
if get(handles.ckbBET,'value')
    mkdir([DataDir,filesep,'DTIImgB'])

   DTIlist = dir ([DataDir,filesep,'DTIImg',filesep,'*.nii.gz'])  ;
   bvallist = dir ([DataDir,filesep,'DTIImg',filesep,'*.bval'])  ;
   bveclist = dir ([DataDir,filesep,'DTIImg',filesep,'*.bvec'])  ;
   cd ([DataDir,filesep,'DTIImgB'])
   
   copyfile([DataDir,filesep,'DTIImg',filesep,DTIlist(1).name],...
       [DataDir,filesep,'DTIImgB',filesep,'data.nii.gz']) ;
   copyfile([DataDir,filesep,'DTIImg',filesep,bvallist(1).name],...
       [DataDir,filesep,'DTIImgB',filesep,'bval']) ;
   copyfile([DataDir,filesep,'DTIImg',filesep,bveclist(1).name],...
       [DataDir,filesep,'DTIImgB',filesep,'bvec']) ;
   
cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMSBET.sh')
system(cmd)
end

%% eddy correction
if get(handles.ckbEC,'value')
   mkdir([DataDir,filesep,'DTIImgBC']) 
   
   cd ([DataDir,filesep,'DTIImgB']) 
   cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMSEddyCorr.sh')
   system(cmd)
   
   movefile([DataDir,filesep,'DTIImgB',filesep,'dataBC.nii.gz'],...
       [DataDir,filesep,'DTIImgBC',filesep,'dataBC.nii.gz']) ;
   copyfile([DataDir,filesep,'DTIImgB',filesep,'bval'],...
       [DataDir,filesep,'DTIImgBC',filesep,'bval']) ;
   copyfile([DataDir,filesep,'DTIImgB',filesep,'bvec'],...
       [DataDir,filesep,'DTIImgBC',filesep,'bvec']) ;
   copyfile([DataDir,filesep,'DTIImgB',filesep,'dataB_mask.nii.gz'],...
       [DataDir,filesep,'DTIImgBC',filesep,'dataB_mask.nii.gz']) ;
end

%% DTIFIT
  if get(handles.ckbDTIFIT,'value')
%    mkdir([DataDir,filesep,'DTIImgBCF']) 
   
   cd ([DataDir,filesep,'DTIImgBC']) 
   cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMSDTIFIT.sh')
   system(cmd)
   
   copyfile([DataDir,filesep,'DTIImgBC'],...
       [DataDir,filesep,'DTIImgBCF']) ;
   rmdir([DataDir,filesep,'DTIImgBC'],'s')  ;
end 
   
%% BEDPOSTX
  if get(handles.ckbBED,'value')
%    mkdir([DataDir,filesep,'DTIImgBCF']) 
   
   cd ([DataDir,filesep,'DTIImgBCF']) ;
   copyfile(['dataBC.nii.gz'],['data.nii.gz']);
   copyfile(['dataB_mask.nii.gz'],['nodif_brain_mask.nii.gz']);
   movefile(['bval'],['bvals']);
   movefile(['bvec'],['bvecs']);
   cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMSBEDPOSTX.sh')
   system(cmd)
  end  

%% T1Raw to T1Img
if get(handles.ckbSCT12NII,'value')
    mkdir([DataDir,filesep,'T1Img']);
    if ispc
    eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii.exe '],...
       [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii.ini'],...
       [' -o ',DataDir,filesep,'T1Img'],' ',[DataDir,filesep,'T1Raw']]);
    else
    eval(['!chmod +x ' ProgramPath,filesep,'DCM2NII',filesep,'dcm2nii_linux'])
       eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii_linux '],...
       [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii_linux.ini'],...
       [' -o ',DataDir,filesep,'T1Img'],' ',[DataDir,filesep,'T1Raw']]); 
    end
end
%% Exctracting brain issues
if get(handles.ckbSCT1BET,'value')
    cd([DataDir,filesep,'T1Img'])

   T1list = dir ([DataDir,filesep,'T1Img',filesep,'co*.nii.gz'])  ;
   copyfile([DataDir,filesep,'T1Img',filesep,T1list(1).name],...
       [DataDir,filesep,'T1Img',filesep,'data.nii.gz']) ;
      
cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMSBET.sh')
system(cmd)
end
%% Coregistrating FA to T1, and T1 to MNI, and the invrse matrix
if get(handles.ckbSCT12FA,'value')
   FAlist = dir ([DataDir,filesep,'DTIImgBCF',filesep,'*FA.nii.gz'])  ;
    copyfile ([DataDir,filesep,'DTIImgBCF',filesep,FAlist(1).name],...
        [DataDir,filesep,'T1Img',filesep,'FA.nii.gz']) ;
   cd([DataDir,filesep,'T1Img']) ; 
   
cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMSFA2T1.sh')
system(cmd)

cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMST12MNI.sh')
system(cmd)

end

% %% T1 segmentation
% if get(handles.ckbSegT1,'value')
%    mkdir([DataDir,filesep,'T1ImgSeg'])
%     copyfile ([DataDir,filesep,'T1Img',filesep,'data.nii.gz'],...
%         [DataDir,filesep,'T1ImgSeg',filesep,'data.nii.gz']) ;
%     copyfile ([DataDir,filesep,'T1Img',filesep,'dataB.nii.gz'],...
%         [DataDir,filesep,'T1ImgSeg',filesep,'dataB.nii.gz']) ;
%     copyfile ([DataDir,filesep,'T1Img',filesep,'FA2T1.mat'],...
%         [DataDir,filesep,'T1ImgSeg',filesep,'FA2T1.mat']) ;
%     gunzip ([DataDir,filesep,'T1ImgSeg',filesep,'data.nii.gz']) % SPM segementation did not see *.gz
%     delete ([DataDir,filesep,'T1ImgSeg',filesep,'data.nii.gz'])   
%     TMSseg([DataDir,filesep,'T1ImgSeg',filesep,'data.nii']);
%     
%     % to get matrix from betT1 to MNI space and the inversed one
%     cmd = cat(2, 'sh ', [ProgramPath,filesep], 'TMST12MNI.sh')
%     system(cmd)
% 
% end

%% probabilistic tracking
if get(handles.ckbPROBTRACKX,'value')
     
   mkdir([DataDir,filesep,'Results']) ;
   SCseedDir = get( handles.edtSCSeedDir,'String');
   SCtargetDir = get( handles.edtSCTargetDir,'String');

   % transform MNI ROIs to native space
   if get(handles.rdbMNIspace,'Value')
      copyfile(SCseedDir(1:end-2),[DataDir,filesep,'T1Img',filesep,'SeedImage.nii']) ;
      copyfile(SCtargetDir(1:end-2),[DataDir,filesep,'T1Img',filesep,'TargetImage.nii']) ;
        
    cd([DataDir,filesep,'T1Img'])
    cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep], 'TMSMNI2Native.sh')
    system(cmd)    

      
    movefile([DataDir,filesep,'T1Img',filesep,'SeedImage_NaSp.nii.gz'],...
        [DataDir,filesep,'Results',filesep,'SeedImage_NaSp.nii.gz']) ;
    movefile([DataDir,filesep,'T1Img',filesep,'TargetImage_NaSp.nii.gz'],...
        [DataDir,filesep,'Results',filesep,'TargetImage_NaSp.nii.gz']) ;
   end
   
   if get(handles.rdbNativeSpace,'Value')
      copyfile(SCseedDir(1:end-2),[DataDir,filesep,'Results',filesep,'SeedImage.nii']) ;
      copyfile(SCtargetDir(1:end-2),[DataDir,filesep,'Results',filesep,'TargetImage.nii']) ;
   end
   
    
   cd(DataDir)
   cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep],'TMSProbTrack.sh')
   system(cmd) 
   
  
end

%% get the target image for stimulation 
   copyfile([DataDir,filesep,'Results',filesep,'fdt_paths.nii.gz'],...
      [DataDir,filesep,'Results',filesep,'Fiber.nii.gz'])  ;
   cd(DataDir)
   cmd = cat(2, 'sh ', [ProgramPath,filesep,'DTIFun',filesep],'TMSNative2MNI.sh') 
   system(cmd)    
   
  
  gunzip([DataDir,filesep,'Results',filesep,'Fiber_MNISp.nii.gz'])  ;
  FiberHeader = spm_vol([DataDir,filesep,'Results',filesep,'Fiber_MNISp.nii']) ;
  [FiberVol,FiberXYZ] = spm_read_vols(FiberHeader)  ;   
  
  TMSreslice([DataDir,filesep,'Results',filesep,'Fiber_MNISp.nii'],...
      [DataDir,filesep,'T1Img',filesep,'TargetImage.nii'],...
      [DataDir,filesep,'Results'])

  TargetHeader = spm_vol([DataDir,filesep,'Results',filesep,'rTargetImage.nii']) ;
  [TargetVol,TargetXYZ] = spm_read_vols(TargetHeader)  ; 
  
  ResVol = TargetVol.*FiberVol ;
  
  % Save the voxel with the highest connectivity with seed image
   temp=inv(FiberHeader.mat)*[0,0,0,1]';
   Origin=temp(1:3)';
   VoxelSize = sqrt(sum(FiberHeader.mat(1:3,1:3).^2));
  
ResVol2 = reshape(ResVol,size(ResVol,1)*size(ResVol,2)*size(ResVol,3),1) ;
ResVol(find(ResVol<max(ResVol2)))=0 ;
[MatX MatY MatZ]=ind2sub(size(ResVol),find(ResVol==max(ResVol2)))  ;
MatrixCenter=[MatX MatY MatZ];
MNICenter = [-1 1 1].*(MatrixCenter-Origin).*VoxelSize  ;  % matrix to MNI coordinate
TMSsphereROI (MNICenter,6,[DataDir,filesep,'Results']) ;

delete([DataDir,filesep,'Results',filesep,'SphereROI1.nii']);
movefile([DataDir,filesep,'Results',filesep,'SphereROI2.nii'],...
    [DataDir,filesep,'Results',filesep,'StiTarget_MNISp.nii']) ; 

%% save the finally images for navigation
mkdir([DataDir,filesep,'Results',filesep,'Image4Navigation'])
copyfile([DataDir,filesep,'T1Img',filesep,'data.nii.gz'],...
      [DataDir,filesep,'Results',filesep,'Image4Navigation',filesep,'T1.nii.gz']) ;

refImage = [DataDir,filesep,'T1Img',filesep,'dataB.nii.gz'];
inputImage = [DataDir,filesep,'Results',filesep,'StiTarget_MNISp.nii'] ;
outImage = [DataDir,filesep,'Results',filesep,'Image4Navigation',filesep,'StiTarget_T1Sp.nii'] ;
warpImage = [DataDir,filesep,'T1Img',filesep,'MNI2T1transf.nii.gz'];
cmd = cat(2, 'applywarp --ref=',[refImage],' --in=',[inputImage],' --warp=',[warpImage],' --out=',[outImage])
system(cmd)    
 


  
  

    
    
    


function uipanel4_CreateFcn(hObject, eventdata, handles)
function uipanel6_CreateFcn(hObject, eventdata, handles)
function ckbSCT1BET_CreateFcn(hObject, eventdata, handles)

