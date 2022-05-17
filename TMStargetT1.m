function varargout = TMStarget(varargin)
%   TMStarget GUI by Gong-Jun JI
%-----------------------------------------------------------
%	Copyright(c) 2016; GNU GENERAL PUBLIC LICENSE
%	Laboratory of Cognitive Neuropsychology, Department of Medical Psychology, Anhui Medical University
%   Written by Gong-Jun JI
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TMStarget

% Last Modified by GUIDE v2.5 07-Jan-2021 15:50:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TMStarget_OpeningFcn, ...
                   'gui_OutputFcn',  @TMStarget_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before TMStarget is made visible.
function TMStarget_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for TMStarget
handles.output = hObject;

set(handles.figure1,'outerposition',[80 50 110 30],'color',[0.94 0.94 0.94])
movegui(hObject,'center')

set(handles.text4,'string','Produce target by T1 segment','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',15,'unit','normalized','pos',[0.1 0.9 0.8 0.07])
set(handles.T1dir,'string','Data directory','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.07 0.75 0.25 0.1])
set(handles.InvMatDir,'string','Mat file','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.07 0.6 0.25 0.1])

set(handles.TargetDir,'string','Target image','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.07 0.45 0.25 0.1])
set(handles.OutputDir,'string','Out directory','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.07 0.3 0.25 0.1])

set(handles.edit2,'string','Directory contain T1Raw or T1Img','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.35 0.75 0.56 0.1])
set(handles.edit6,'backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.35 0.6 0.56 0.1])
set(handles.edit1,'string','Target image in MNI space','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.35 0.45 0.56 0.1])
set(handles.edit3,'string','Output directory','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.35 0.3 0.56 0.1])

set(handles.RunT1,'string','Run','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',12,'unit','normalized','pos',[0.78 0.18 0.13 0.1])

% Update handles structure
guidata(hObject, handles);
% --- Outputs from this function are returned to the command line.
function varargout = TMStarget_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TargetDir.
function TargetDir_Callback(hObject, eventdata, handles)
% hObject    handle to TargetDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
ROIDir =pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	ROIDir = spm_select(1,'image','Select the Target image in MNI space, *.nii')
    if ischar(ROIDir),
		set(handles.edit1,'String',ROIDir)
    end
    guidata(hObject, handles);

% --- Executes on button press in T1dir.
function T1dir_Callback(hObject, eventdata, handles)
	T1Dir =pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	T1Dir = spm_select(1,'dir','Select the folder contain T1Raw or T1Img')
    if ischar(T1Dir),
		set(handles.edit2,'String',T1Dir)
    end
      
guidata(hObject, handles);



function SetDataDir_Callback(hObject, eventdata, handles)
% hObject    handle to SetDataDir (see GCBO)
function SetDataDir_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OutputDir.
function OutputDir_Callback(hObject, eventdata, handles)
 theDir =pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	theDir = spm_select(1,'Dir','please the output folder')
    if ischar(theDir),
		set(handles.edit3,'String',theDir)
   end
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%



function ckbReorientT1_Callback(hObject, eventdata, handles)
function pushbutton11_Callback(hObject, eventdata, handles)

function ckbReorientImage_Callback(hObject, eventdata, handles)
spm_image


function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function InvMatDir_Callback(hObject, eventdata, handles)
MatDir =[];
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	MatDir = spm_select(1,'mat','Select the mat file, *.mat')
    if ischar(MatDir),
		set(handles.edit6,'String',MatDir)
   
    end
    guidata(hObject, handles);
    
% --- Executes on button press in RunT1.
function RunT1_Callback(hObject, eventdata, handles)
 %% T1Raw to T1Img
     
 T1Dir = get( handles.edit2,'String');
 
 [ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'));
 if ~exist([T1Dir,filesep,'T1Img'])
    mkdir([T1Dir,filesep,'T1Img']);
    if ispc
    eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii.exe '],...
       [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii.ini'],...
       [' -o ',T1Dir,filesep,'T1Img'],' ',[T1Dir,filesep,'T1Raw']]);
    else
    eval(['!chmod +x ' ProgramPath,filesep,'DCM2NII',filesep,'dcm2nii_linux'])
       eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii_linux '],...
       [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2nii_linux.ini'],...
       [' -o ',T1Dir,filesep,'T1Img'],' ',[T1Dir,filesep,'T1Raw']]); 
    end
 end
    
    OutDir = get( handles.edit3,'String');
    ROIDir = get( handles.edit1,'String');
    MatDir = get( handles.edit6,'String');
    
TMStargetT1_run ([T1Dir,filesep,'T1Img'],ROIDir,MatDir,OutDir) ;
mkdir([OutDir,filesep,'Results',filesep,'Image4Navigation'])   ;

rwlist = dir ([OutDir,filesep,'Results',filesep,'rw*.nii']) ;
movefile([OutDir,filesep,'Results',filesep,rwlist(1).name],...
    [OutDir,filesep,'Results',filesep,'Image4Navigation',filesep,'StiTarget_T1Sp.nii']) ;
colist = dir ([OutDir,filesep,'Results',filesep,'co*.nii']) ;
movefile([OutDir,filesep,'Results',filesep,colist(1).name],...
    [OutDir,filesep,'Results',filesep,'Image4Navigation',filesep,'T1.nii']) ;







