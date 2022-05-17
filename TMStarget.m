function varargout = TMStarget(varargin)

%   TMStarget GUI by Gong-Jun JI
%-----------------------------------------------------------
%	Copyright(c) 2016; GNU GENERAL PUBLIC LICENSE
%	Laboratory of Cognitive Neuropsychology, Department of Medical Psychology, Anhui Medical University
%   Written by Gong-Jun JI
% 	Mail to Author: "jigongjun@163.com", Gong-Jun JI, Ph.D.
%	Version=1.0;
% Last Modified by GUIDE v2.5 25-Nov-2017 16:29:50

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

% 	fprintf('Hope TMStarget is helpful to your work!\n')
%      fprintf('Mail to Author: "jigongjun@163.com", Gong-Jun JI, Ph.D.\n')
%     
    % --- Executes just before TMStarget is made visible.


% --- Outputs from this function are returned to the command line.
function varargout = TMStarget_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function SetDataDir_Callback(hObject, eventdata, handles)
% hObject    handle to SetDataDir (see GCBO)

% --- Executes during object creation, after setting all properties.
function SetDataDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes during object creation, after setting all properties.
function fig_CreateFcn(hObject, eventdata, handles)
function T1based_Callback(hObject, eventdata, handles)
TMStargetT1
function FCbased_Callback(hObject, eventdata, handles)
TMStargetFC
function Utilities_Callback(hObject, eventdata, handles)
TMSUtility_GUI
function FigTMS_CreateFcn(hObject, eventdata, handles)

function listbox2_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ppm1Toolbox_Callback(hObject, eventdata, handles)
%        contents{get(hObject,'Value')} returns selected item from ppm1Toolbox
val = get(handles.ppm1Toolbox,'Value') ;
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
function ppm1Toolbox_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
TMStargetSC

% --- Executes just before dpabi is made visible.
function TMStarget_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

fprintf('Copyright(c) 2017; GNU GENERAL PUBLIC LICENSE\n');
fprintf('Department of Medical Psychology;\n');
fprintf('Anhui Medical University, 81 Meishan Road, Hefei 230032, China;\n');
fprintf('Mail to Initiator (Dr. JI Gong-Jun): jigongjun@163.com\n');
fprintf('-----------------------------------------------------------\n');
fprintf('Citing Information:\nIf TMStarget is useful for your work, please cite following paper:\nJI, G.J., YU, F., LAIO, W., WANG, K., 2017. Dynamic aftereffects in supplementary motor network following inhibitory transcranial magnetic stimulation protocols. NeuroImage 149, 285-294.\n');

axes(handles.FigTMS);
% axis image;
 
[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'));
% h=imread([ProgramPath filesep,'TMStarget2.jpg']);
imshow([ProgramPath filesep,'TMStarget2.jpg']);
 handles.output = hObject;
guidata(hObject, handles);
   
