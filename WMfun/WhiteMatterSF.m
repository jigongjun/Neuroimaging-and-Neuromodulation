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

% Last Modified by GUIDE v2.5 25-Apr-2020 03:02:13

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
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WhiteMatterSF (see VARARGIN)

% Choose default command line output for WhiteMatterSF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WhiteMatterSF wait for user response (see UIRESUME)
% uiwait(handles.WhiteMatterSF);


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
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
