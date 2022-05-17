function varargout = TMSreslice_GUI(varargin)
% TMSRESLICE_GUI M-file for TMSreslice_GUI.fig
%      TMSRESLICE_GUI, by itself, creates a new TMSRESLICE_GUI or raises the existing
%      singleton*.
%
%      H = TMSRESLICE_GUI returns the handle to a new TMSRESLICE_GUI or the handle to
%      the existing singleton*.
%
%      TMSRESLICE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TMSRESLICE_GUI.M with the given input arguments.
%
%      TMSRESLICE_GUI('Property','Value',...) creates a new TMSRESLICE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TMSreslice_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TMSreslice_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TMSreslice_GUI

% Last Modified by GUIDE v2.5 11-Nov-2016 16:07:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TMSreslice_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TMSreslice_GUI_OutputFcn, ...
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


% --- Executes just before TMSreslice_GUI is made visible.
function TMSreslice_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = TMSreslice_GUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function edit1SampleImageReslice_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1SampleImageReslice_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2ImageNeedReslice_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2ImageNeedReslice_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in phbSampleImageReslice.
function phbSampleImageReslice_Callback(hObject, eventdata, handles)
 theSampleImageResliceDir =pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	theSampleImageResliceDir = spm_select(1,'Image','please the sample image') ;
    if ischar(theSampleImageResliceDir),
		set(handles.edit1SampleImageReslice,'String',theSampleImageResliceDir(1:end-2))
   end
guidata(hObject, handles);

% --- Executes on button press in phbImageNeedReslice.
function phbImageNeedReslice_Callback(hObject, eventdata, handles)
% hObject    handle to phbImageNeedReslice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 theImageNeedResliceDir =pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	theImageNeedResliceDir = spm_select(1,'Image','please the sample image') ;
    if ischar(theImageNeedResliceDir),
		set(handles.edit2ImageNeedReslice,'String',theImageNeedResliceDir(1:end-2))
   end
guidata(hObject, handles);


% --- Executes on button press in phb3Reslice.
function phb3Reslice_Callback(hObject, eventdata, handles)
T1dir = get (handles.edit1SampleImageReslice,'String');
ROIidvDir = get (handles.edit2ImageNeedReslice,'String');
OutDir = get (handles.edit3OutputDirReslice,'String');
TMSreslice(T1dir,ROIidvDir,OutDir) 


function edit3OutputDirReslice_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3OutputDirReslice_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in phb4OutputDirReslice.
function phb4OutputDirReslice_Callback(hObject, eventdata, handles)
 theROIOutDirReslice = pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	theROIOutDirReslice = spm_select(1,'Dir','please the output folder')
    if ischar(theROIOutDirReslice),
		set(handles.edit3OutputDirReslice,'String',theROIOutDirReslice)
   end
guidata(hObject, handles);
