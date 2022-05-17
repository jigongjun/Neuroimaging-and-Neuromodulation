function varargout = TMSsphereROI_GUI(varargin)
% TMSSPHEREROI_GUI M-file for TMSsphereROI_GUI.fig
%      TMSSPHEREROI_GUI, by itself, creates a new TMSSPHEREROI_GUI or raises the existing
%      singleton*.
%
%      H = TMSSPHEREROI_GUI returns the handle to a new TMSSPHEREROI_GUI or the handle to
%      the existing singleton*.
%
%      TMSSPHEREROI_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TMSSPHEREROI_GUI.M with the given input arguments.
%
%      TMSSPHEREROI_GUI('Property','Value',...) creates a new TMSSPHEREROI_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TMSsphereROI_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TMSsphereROI_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TMSsphereROI_GUI

% Last Modified by GUIDE v2.5 07-Nov-2016 09:02:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TMSsphereROI_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TMSsphereROI_GUI_OutputFcn, ...
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


% --- Executes just before TMSsphereROI_GUI is made visible.
function TMSsphereROI_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TMSsphereROI_GUI (see VARARGIN)

% Choose default command line output for TMSsphereROI_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TMSsphereROI_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TMSsphereROI_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1MNIX_Callback(hObject, eventdata, handles)
% hObject    handle to edit1MNIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1MNIX as text
%        str2double(get(hObject,'String')) returns contents of edit1MNIX as a double


% --- Executes during object creation, after setting all properties.
function edit1MNIX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1MNIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2MNIY_Callback(hObject, eventdata, handles)
% hObject    handle to edit2MNIY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2MNIY as text
%        str2double(get(hObject,'String')) returns contents of edit2MNIY as a double


% --- Executes during object creation, after setting all properties.
function edit2MNIY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2MNIY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3MNIZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit3MNIZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3MNIZ as text
%        str2double(get(hObject,'String')) returns contents of edit3MNIZ as a double


% --- Executes during object creation, after setting all properties.
function edit3MNIZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3MNIZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4SphereRadius_Callback(hObject, eventdata, handles)
% hObject    handle to edit4SphereRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4SphereRadius as text
%        str2double(get(hObject,'String')) returns contents of edit4SphereRadius as a double


% --- Executes during object creation, after setting all properties.
function edit4SphereRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4SphereRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function editROIOutDir_Callback(hObject, eventdata, handles)
% hObject    handle to editROIOutDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editROIOutDir as text
%        str2double(get(hObject,'String')) returns contents of editROIOutDir as a double


% --- Executes during object creation, after setting all properties.
function editROIOutDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editROIOutDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in phbROIOutputDir.
function phbROIOutputDir_Callback(hObject, eventdata, handles)
% hObject    handle to phbROIOutputDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 theROIOutDir =pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	theROIOutDir = spm_select(1,'Dir','please the output folder')
    if ischar(theROIOutDir),
		set(handles.editROIOutDir,'String',theROIOutDir)
   end
guidata(hObject, handles);


function edit6SampleImage_Callback(hObject, eventdata, handles)
% hObject    handle to edit6SampleImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6SampleImage as text
%        str2double(get(hObject,'String')) returns contents of edit6SampleImage as a double


% --- Executes during object creation, after setting all properties.
function edit6SampleImage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6SampleImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in phbSampleImageDir.
function phbSampleImageDir_Callback(hObject, eventdata, handles)
% hObject    handle to phbSampleImageDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in phbGenerate.
 theROISampleDir =pwd;
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	theROISampleDir = spm_select(1,'Image','please the sample image') ;
    if ischar(theROISampleDir),
		set(handles.edit6SampleImage,'String',theROISampleDir)
   end
guidata(hObject, handles);


function phbGenerate_Callback(hObject, eventdata, handles)
% hObject    handle to phbGenerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MNIx = get(handles.edit1MNIX,'String') ;
MNIy = get(handles.edit2MNIY,'String') ;
MNIz = get(handles.edit3MNIZ,'String') ;
MNICenter=[str2num(MNIx) str2num(MNIy) str2num(MNIz)]  
ROIRadius=str2num(get(handles.edit4SphereRadius,'String')) 
 OutDir = get( handles.editROIOutDir,'String')
 SampleImage = get( handles.edit6SampleImage,'String') ;
TMSsphereROI (MNICenter,ROIRadius,OutDir,SampleImage) ;
