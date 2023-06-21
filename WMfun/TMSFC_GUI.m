function varargout = TMSFC_GUI(varargin)
% TMSFC_GUI M-file for TMSFC_GUI.fig
%      TMSFC_GUI, by itself, creates a new TMSFC_GUI or raises the existing
%      singleton*.
%
%      H = TMSFC_GUI returns the handle to a new TMSFC_GUI or the handle to
%      the existing singleton*.
%
%      TMSFC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TMSFC_GUI.M with the given input arguments.
%
%      TMSFC_GUI('Property','Value',...) creates a new TMSFC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TMSFC_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TMSFC_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TMSFC_GUI

% Last Modified by GUIDE v2.5 11-Apr-2023 13:00:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TMSFC_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TMSFC_GUI_OutputFcn, ...
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


% --- Executes just before TMSFC_GUI is made visible.
function TMSFC_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for TMSFC_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TMSFC_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TMSFC_GUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function editMaskDir_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMaskDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit6SeedImage_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit6SeedImage_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function phbSeedDir_Callback(hObject, eventdata, handles)
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	SeedDir = spm_select(1,'Image','please the sample image') ;
    if ischar(SeedDir),
		set(handles.edit6SeedImage,'String',SeedDir(1:end-2))
   end
guidata(hObject, handles);

function phbMaskDir_Callback(hObject, eventdata, handles)
	MaskDir = spm_select(1,'Image','please the sample image')
    if ischar(MaskDir),
		set(handles.editMaskDir,'String',MaskDir(1:end-2))
   end
guidata(hObject, handles);

function pb6OutDir_Callback(hObject, eventdata, handles)
	OutDir = spm_select(1,'dir','please the output dir') ;
    if ischar(OutDir)
		set(handles.editOutDir,'String',OutDir)
   end
guidata(hObject, handles);

function editOutDir_Callback(hObject, eventdata, handles)

function phbGenerate_Callback(hObject, eventdata, handles)
 DataDir =  get(handles.EDdatadir,'String') ;
 SeedDir = get(handles.edit6SeedImage,'String') ;
 MaskDir = get(handles.editMaskDir,'String') 
 OutDir = get (handles.editOutDir,'String') 
 [seeddir seedname seedext ] = fileparts(SeedDir) ;

 if size(MaskDir,1)==1
     progdir = fileparts (which ('TMStarget')) ;
     MaskDir = [progdir,filesep,'mask',filesep,'BrainMask_05_61x83x61.nii']
 end
 
  list = dir(DataDir) ;
      for i = 3  : length(dir(DataDir))
           imglist = dir([DataDir,filesep,list(i).name,filesep,'*.nii']) ;
           WMMultiSeedFC([DataDir,filesep,list(i).name,filesep,imglist(1).name], SeedDir, MaskDir, OutDir)  ;
           movefile( [OutDir,filesep, [seedname '_zFCmap.nii']] ,   [OutDir,filesep, [list(i).name seedname '_zFCmap.nii']] )  ;
      end
      
      
function EDdatadir_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbDataDir.
function pbDataDir_Callback(hObject, eventdata, handles)
        DataDir =uigetdir;
       set(handles.EDdatadir,'String',DataDir)
function EDdatadir_Callback(hObject, eventdata, handles)
  
% --- Executes during object creation, after setting all properties.
function editOutDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
