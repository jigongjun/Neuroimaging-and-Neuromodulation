function varargout = WhiteMatterSF(varargin)
% WHITEMATTERSF M-file for WhiteMatterSF.fig
%      WHITEMATTERSF, by itself, creates a new WHITEMATTERSF or raises the existing
%      singleton*.
%
%      H = WHITEMATTERSF returns the handle to a new WHITEMATTERSF or the handle to
%      the existing singleton*.
%
%      WHITEMATTERSF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WHITEMATTERSF.M with the given input arguments.
%
%      WHITEMATTERSF('Property','Value',...) creates a new WHITEMATTERSF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WhiteMatterSF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WhiteMatterSF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WhiteMatterSF

% Last Modified by GUIDE v2.5 12-Apr-2023 18:07:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WhiteMatterSF_OpeningFcn, ...
                   'gui_OutputFcn',  @WhiteMatterSF_OutputFcn, ...
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


% --- Executes just before WhiteMatterSF is made visible.
function WhiteMatterSF_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'));


axes(handles.axes2);
guidata(hObject, handles);
imshow([ProgramPath, filesep,'FiberStatic1.png']);
 handles.output = hObject;
guidata(hObject, handles);

% axes(handles.axes2);
% guidata(hObject, handles);
% im = imread([ProgramPath, filesep,'DynamicFiber.gif']);
% imshow(im);
%  handles.output = hObject;
% guidata(hObject, handles);

% 
% f=figure
% logo_gif = [ProgramPath, filesep,'DynamicFiber.gif'];
% je = javax.swing.JEditorPane('text/html', ['<html>< img src=file:/',logo_gif,'/></html>']);
% je.setBackground(java.awt.Color(0.85,0.85,0.85));  
% [hj, hc] =  javacomponent(je,[],f);
% set(hc, 'units','normalized','pos', [0.05,0.05,0.45,0.45]);






% --- Outputs from this function are returned to the command line.
function varargout = WhiteMatterSF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
WhiteMatter

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
TMSFC_GUI

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
spm_image
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
val = get(handles.popupmenu1,'Value') ;
switch val
    case 2
        TMSsphereROI_GUI
    case 3
        spm_image
    case 4
        TMSreslice_GUI
    case 5
        TMSFlipImageLR
    case 6
        TMSTPCalc
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
