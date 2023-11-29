function varargout = TSA(varargin)
% TSA M-file for TSA.fig
%      TSA, by itself, creates a new TSA or raises the existing
%      singleton*.
%
%      H = TSA returns the handle to a new TSA or the handle to
%      the existing singleton*.
%
%      TSA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TSA.M with the given input arguments.
%
%      TSA('Property','Value',...) creates a new TSA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TSA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TSA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TSA

% Last Modified by GUIDE v2.5 08-May-2019 17:38:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TSA_OpeningFcn, ...
                   'gui_OutputFcn',  @TSA_OutputFcn, ...
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


% --- Executes just before TSA is made visible.
function TSA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TSA (see VARARGIN)

% Choose default command line output for TSA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TSA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TSA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)




% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
	theDir = spm_select(1,'image','please the ROI image in MNI space,*.nii') ;
    if ischar(theDir),
		set(handles.edit1,'String',theDir)
   end
guidata(hObject, handles);


function edit2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
	theDir = spm_select(1,'dir','please the preprocessed image dir folder') ;
    if ischar(theDir),
		set(handles.edit2,'String',theDir)
   end
guidata(hObject, handles);



function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
	theDir = spm_select(1,'dir','please the preprocessed image dir folder') ;
    if ischar(theDir),
		set(handles.edit3,'String',theDir)
   end
guidata(hObject, handles);


function edit4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
%     theDir =uigetdir(theDir, 'Please select the data directory to convert: ');
	theDir = spm_select(1,'dir','please the preprocessed image dir folder') ;
    if ischar(theDir),
		set(handles.edit4,'String',theDir)
   end
guidata(hObject, handles);

% RefDataDir
% TargetDataDir



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
	theDir = spm_select(1,'image','please the mask image in *nii') ;
    if ischar(theDir),
		set(handles.edit9,'String',theDir)
   end
guidata(hObject, handles);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
ShiftNumb = str2num( get(handles.edit8,'String')) ;
ROIMaskDir = get( handles.edit1,'String') ;
GMMaskDir = get( handles.edit9,'String') ;
WMMaskDir = get( handles.edit10,'String') ;
RefDataDir = get( handles.edit2,'String');
TargetDataDir = get( handles.edit3,'String');
OutputDir = get( handles.edit4,'String');

mkdir([OutputDir,filesep,'Result']) ;

sublist = dir (RefDataDir) 




for i = 4 : length(sublist)
    ImgList = dir ([RefDataDir,filesep,sublist(i).name,filesep,'*.nii'])  ;
    DataHeader = spm_vol([RefDataDir,filesep,sublist(i).name,filesep,ImgList(1).name]) ;
    [DataVol4d,XYZ] = spm_read_vols(DataHeader)  ;
  
[Dim1 Dim2 Dim3 Dim4 ]= size (DataVol4d) ;
%  Data=DataVol ;
 DataVol = reshape(DataVol4d,[],Dim4);
 
%% read GMmask WMMask image
    GMMaskHeader = spm_vol(GMMaskDir) ;
    [GMMaskVol,GMMaskXYZ] = spm_read_vols(GMMaskHeader)  ;
    GMMaskVol(find(GMMaskVol))=1;
        if Dim1~= size(GMMaskVol,1)
           errordlg( 'The mask and functional data show different dimention' ); 
        end
    GMMaskVol = reshape(GMMaskVol,Dim1*Dim2*Dim3,1) ;

    WMMaskHeader = spm_vol(WMMaskDir) ;
    [WMMaskVol,WMMaskXYZ] = spm_read_vols(WMMaskHeader)  ;
    WMMaskVol(find(WMMaskVol))=1;
        if Dim1~= size(WMMaskVol,1)
           errordlg( 'The mask and functional data show different dimention' ); 
        end
    WMMaskVol = reshape(WMMaskVol,Dim1*Dim2*Dim3,1) ; 
    
    ROIMaskHeader = spm_vol(ROIMaskDir) ;
    [ROIMaskVol,WMMaskXYZ] = spm_read_vols(ROIMaskHeader)  ;
    ROIMaskVol(find(ROIMaskVol))=1;
        if Dim1~= size(ROIMaskVol,1)
           errordlg( 'The mask and functional data show different dimention' ); 
        end
    ROIMaskVol = reshape(ROIMaskVol,Dim1*Dim2*Dim3,1) ; 
    ROIMaskVol = ROIMaskVol.*GMMaskVol ;
    %% read seed image and get ROI signal

for j = 1 : Dim4
    SeedSig = ROIMaskVol.*DataVol(:,j) ;
    SeedSignal(j) = mean(SeedSig(find(SeedSig))) ;
end

    if size(DataVol,1)~= size(ROIMaskVol,1)
  errordlg( 'the mask and functional data show different dimention' ); 
    end
    
    %% calculate FC map
for sh = 1 : length (ShiftNumb)
    shstr = num2str(ShiftNumb(sh)) ;
    OutVol = zeros(271633,1) ;
    [a b] = find(WMMaskVol) ;
%%
    fprintf('\n\tCalculating seed-based functional connectivity...\n');
       for k = 1 : size(find(WMMaskVol),1)
           [OutVol(a(k,1),1),p] = corr(SeedSignal(1,1:size(SeedSignal,2)-ShiftNumb(sh))'...
               ,DataVol(a(k,1),ShiftNumb(sh)+1:size(SeedSignal,2))');
           fprintf('.');
       end
%%
% [rValues,p] = corr(SeedSignal(1,1:size(SeedSignal,2)-ShiftNumb(sh))'...
%                ,DataVol(:,ShiftNumb(sh)+1:size(SeedSignal,2))');
           
           
    rValues=OutVol ;

    FCMap = reshape(rValues,Dim1,Dim2,Dim3) ;
    aname = ['FC_SH' num2str(shstr), sublist(i).name '.nii'] ;
    ROIMaskHeader.fname = [OutputDir,filesep,'Result',filesep,aname] ;
    spm_write_vol(ROIMaskHeader,FCMap) ;
end    
end
    



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
	theDir = spm_select(1,'image','please the mask image in *nii') ;
    if ischar(theDir),
		set(handles.edit10,'String',theDir)
   end
guidata(hObject, handles);
