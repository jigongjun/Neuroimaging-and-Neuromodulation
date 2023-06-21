function varargout = TMStargetFC(varargin)
% TMSTARGETFC MATLAB code for TMStargetFC.fig
%      TMSTARGETFC, by itself, creates a new TMSTARGETFC or raises the existing
%      singleton*.
%
%      H = TMSTARGETFC returns the handle to a new TMSTARGETFC or the handle to
%      the existing singleton*.
%
%      TMSTARGETFC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TMSTARGETFC.M with the given input arguments.
%
%      TMSTARGETFC('Property','Value',...) creates a new TMSTARGETFC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TMStargetFC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TMStargetFC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TMStargetFC

% Last Modified by GUIDE v2.5 25-Jan-2021 23:21:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TMStargetFC_OpeningFcn, ...
                   'gui_OutputFcn',  @TMStargetFC_OutputFcn, ...
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


% --- Executes just before TMStargetFC is made visible.
function TMStargetFC_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
set(handles.figure1,'outerposition',[80 50 120 40],'color',[0.94 0.94 0.94])
movegui(hObject,'center')

set(handles.text1,'string','Producing target by functional connectivity','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',15,'unit','normalized','pos',[0.1 0.93 0.8 0.06])
set(handles.pushbutton1,'string','Data directory','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.09 0.87 0.17 0.05])
set(handles.edit1,'string','Directory of initial folder','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.28 0.87 0.63 0.05])
set(handles.uipanel2,'title','Preprocessing','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',10,'unit','normalized','pos',[0.09 0.35 0.82 0.5])
set(handles.checkbox1,'string','DCM2NII','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.88-0.04 0.2 0.07])
set(handles.checkbox2,'string','Delete','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.78-0.04 0.2 0.07])
set(handles.checkbox3,'string','Despike','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.68-0.04 0.2 0.07])
set(handles.checkbox4,'string','SliTim','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.58-0.04 0.2 0.07])
set(handles.checkbox5,'string','Realign','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.48-0.04 0.2 0.07])
set(handles.checkbox6,'string','Coregistration','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.38-0.04 0.2 0.07])
set(handles.checkbox7,'string','CovReg','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.28-0.04 0.2 0.07])
set(handles.checkbox8,'string','Smooth','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.18-0.04 0.2 0.07])
set(handles.checkbox9,'string','Filter','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.02 0.08-0.04 0.2 0.07])
set(handles.edit2,'string','1','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.15 0.78-0.04 0.04 0.07])
set(handles.edit3,'string','5','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.22 0.78-0.04 0.04 0.07])
set(handles.text7,'string','-','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.195 0.78-0.04 0.02 0.07])
set(handles.text8,'string','TR','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.15 0.58-0.04 0.04 0.07])
set(handles.edit4,'string','2.4','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.19 0.58-0.04 0.05 0.07])
set(handles.text9,'string','Ref','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.25 0.58-0.04 0.05 0.07])
set(handles.edit5,'string','45','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.3 0.58-0.04 0.05 0.07])
set(handles.text10,'string','Order','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.36 0.58-0.04 0.05 0.07])
set(handles.edit6,'string','[1:2:45,2:2:46]','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.41 0.58-0.04 0.2 0.07])
set(handles.radiobutton1,'string','HM','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.18 0.28-0.04 0.2 0.07])
set(handles.radiobutton2,'string','CSF','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.28 0.28-0.04 0.2 0.07])
set(handles.radiobutton3,'string','GS','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.39 0.28-0.04 0.2 0.07])
set(handles.radiobutton4,'string','WM','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.49 0.28-0.04 0.2 0.07])
set(handles.edit7,'string','4','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.18 0.18-0.04 0.05 0.07])
set(handles.edit8,'string','0.01','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.18 0.08-0.04 0.07 0.07])
set(handles.edit9,'string','0.1','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.28 0.08-0.04 0.07 0.07])
set(handles.text11,'string','-','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.25 0.08-0.04 0.03 0.07])
set(handles.ckbM,'string','Merge','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.4 0.08-0.04 0.2 0.07])
           
set(handles.text5,'string','Funcitonal data','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',9,'unit','normalized','pos',[0.02 0.93 0.2 0.07])
set(handles.text6,'string','Stuctural data','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',9,'unit','normalized','pos',[0.7 0.93 0.2 0.07])
              
              
set(handles.pushbutton3,'string','Seed Image','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.02 0.75 0.2 0.2])
set(handles.pushbutton4,'string','Mask Image','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.02 0.54 0.2 0.2])
set(handles.pushbutton5,'string','Output Folder','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.02 0.32 0.2 0.2])
set(handles.edit10,'string','Selcet the seed image','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.24 0.76 0.74 0.185])
set(handles.edit11,'string','Selcet the mask image','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.24 0.55 0.74 0.185])
set(handles.edit12,'string','Select the output folder','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.24 0.34 0.74 0.185])

              
set(handles.checkbox11,'string','DCM2NII','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.7 0.84 0.2 0.07])
set(handles.checkbox12,'string','Reorient','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.7 0.74 0.2 0.07])
set(handles.checkbox13,'string','BET','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.7 0.34 0.2 0.07],'visible','on')
set(handles.checkbox14,'string','Segment','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',8,'unit','normalized','pos',[0.7 0.24 0.2 0.07])
         
              

set(handles.uipanel1,'title','Functional connectivity','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',10,'unit','normalized','pos',[0.09 0.1 0.82 0.25])
set(handles.pushbutton2,'string','Run','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',12,'unit','normalized','pos',[0.81 0.035 0.1 0.05])

set(handles.text13,'string','VoxThr','backgroundcolor',[0.94 0.94 0.94],'enable','off',...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.43 0.10 0.1 0.15])
set(handles.edit13,'string','0.05 212','backgroundcolor',[0.94 0.94 0.94],'enable','off',...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.54 0.11 0.14 0.15])
set(handles.text14,'string','PosNeg','backgroundcolor',[0.94 0.94 0.94],'enable','off',...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.7 0.10 0.11 0.15])
set(handles.edit14,'string','Both','backgroundcolor',[0.94 0.94 0.94],'enable','off',...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.81 0.11 0.16 0.15])
set(handles.checkbox17,'string','FC','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.02 0.13 0.1 0.15])
set(handles.checkbox18,'string','Target','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.3 0.13 0.125 0.15])
set(handles.edit15,'string','25','backgroundcolor',[0.94 0.94 0.94],'enable','off',...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.2 0.13 0.06 0.13])
set(handles.text15,'string','Depth','backgroundcolor',[0.94 0.94 0.94],'enable','off',...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.12 0.12 0.08 0.15])
         
set(handles.edit16,'string','Cores','backgroundcolor',[0.94 0.94 0.94],'enable','on',...
                  'ForegroundColor',[0 0 0],'fontsize',10,'unit','normalized','pos',[0.09 0.05 0.08 0.04])
              
guidata(hObject, handles);

% UIWAIT makes TMStargetFC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TMStargetFC_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function edit16_Callback(hObject, eventdata, handles)
if ~strcmp(get(handles.edit16,'string'),'Cores')
%    NCore = str2num(get(handles.edit16,'string'))
%    if NCore==0 && matlabpool('size') > 0
%       matlabpool close
%    elseif NCore>0 && matlabpool('size') == 0
%       matlabpool ('open', NCore) 
%    elseif NCore>0 && matlabpool('size') > 0
%       matlabpool close
%       matlabpool ('open', NCore) 
%    end
% end

 v = version;
 NCore = str2num(get(handles.edit16,'string'))
if str2num(v(end-5:end-2)) < 2016
   if NCore==0 && matlabpool('size') > 0
      matlabpool close
   elseif NCore>0 && matlabpool('size') == 0
      matlabpool ('open', NCore) 
   elseif NCore>0 && matlabpool('size') > 0
      matlabpool close
      matlabpool ('open', NCore) 
   end
   
   else
    pgcp = gcp('nocreate');
    if NCore>0 && isempty(pgcp) 
      parpool (NCore) 
   elseif NCore>0 && ~isempty(pgcp) 
      delete(gcp('nocreate'))
      parpool (NCore) 
    end
end
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
AnalysisDir = uigetdir;
[DataDir,inifd,cc] = fileparts (AnalysisDir) ;
fprintf('\nYour working directory is: '); 
disp(DataDir) ;
    if ischar(DataDir),
		set(handles.edit1,'String',AnalysisDir) ;
    end
    
    if ~exist ([DataDir,filesep,'SubjList.txt'])
       ListSubj(AnalysisDir);
    else   
       answ = questdlg ('Refresh the list for processing?') ; 
       if strcmp(answ,'Yes')
          delete([DataDir,filesep,'SubjList.txt']);
          ListSubj(AnalysisDir);
       end
    end

function edit1_Callback(hObject, eventdata, handles)
function uipanel2_CreateFcn(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
function checkbox1_Callback(hObject, eventdata, handles)
function checkbox2_Callback(hObject, eventdata, handles)
function checkbox1_CreateFcn(hObject, eventdata, handles)
function checkbox3_Callback(hObject, eventdata, handles)
function checkbox4_Callback(hObject, eventdata, handles)
function checkbox5_Callback(hObject, eventdata, handles)
function checkbox6_Callback(hObject, eventdata, handles)
function checkbox7_Callback(hObject, eventdata, handles)
  if get(handles.checkbox7,'value')
      set(handles.radiobutton1,'value',1);
      set(handles.radiobutton2,'value',1);
      set(handles.radiobutton3,'value',1);
  else
      set(handles.radiobutton1,'value',0);
      set(handles.radiobutton2,'value',0);
      set(handles.radiobutton3,'value',0);
  end
function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit6_Callback(hObject, eventdata, handles)
str2num(get(handles.edit6,'string'));
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function radiobutton1_Callback(hObject, eventdata, handles)
function radiobutton2_Callback(hObject, eventdata, handles)
function radiobutton3_Callback(hObject, eventdata, handles)
function radiobutton4_Callback(hObject, eventdata, handles)
function checkbox8_Callback(hObject, eventdata, handles)
function edit7_Callback(hObject, eventdata, handles)
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.
function checkbox6_CreateFcn(hObject, eventdata, handles)
function checkbox9_Callback(hObject, eventdata, handles)
function checkbox10_Callback(hObject, eventdata, handles)
function checkbox11_Callback(hObject, eventdata, handles)
function checkbox12_Callback(hObject, eventdata, handles)
function checkbox13_Callback(hObject, eventdata, handles)
function checkbox14_Callback(hObject, eventdata, handles)
function edit8_Callback(hObject, eventdata, handles)
function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function text5_CreateFcn(hObject, eventdata, handles)




% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
AnalysisDir = get(handles.edit1,'String');
[DataDir,inifd,cc] = fileparts (AnalysisDir) ;

[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'));
subj = importdata([DataDir,filesep,'SubjList.txt']) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Analysis for STRUCTURAL data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%% T1Raw to T1Img
if get(handles.checkbox11,'value')
    parfor i = 1 : length(subj)
        mkdir([DataDir,filesep,'T1Img',filesep,subj{i}]) ;
        TMSDicomConvert([DataDir,filesep,'T1Raw',filesep,subj{i}],...
                        [DataDir,filesep,'T1Img',filesep,subj{i}]) ; 
    end
end

%% Reorient T1Img
if get(handles.checkbox12,'value')
    for i = 1 : length(subj)
       tempimg = dir([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'co*']);
       if size(tempimg,1)==0
           tempimg = dir([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'*nii*']);
       end
       mrAnatAverageAcpcNifti(...
           [DataDir,filesep,'T1Img',filesep,subj{i},filesep,tempimg(1).name],...
           [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii'],[]) ;
       
       answ = questdlg ('Do the reorient again?') ;
       while strcmp(answ,'Yes')
          mrAnatAverageAcpcNifti(...
             [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii.gz'],...
             [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii'],[]) ; 
             answ = questdlg ('Do the reorient again?') ;   
       end
    end
end    

%% BET T1Img
if get(handles.checkbox13,'value')

    fprintf('\n\t BET the T1 image...\n');
    [BETPath, fileN, extn] = fileparts(which('TMSBET.sh'));
  if ~ispc  
    parfor i = 1 : length(subj)
        cmd = cat(2, 'sh ', [BETPath,filesep], 'TMSBET.sh');
        cd([DataDir,filesep,'T1Img',filesep,subj{i}]) ;
        copyfile('ac_coT1.nii.gz','data.nii.gz')
        system(cmd)
        gunzip([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'dataB.nii.gz']);
        copyfile('dataB.nii','ac_coT1B.nii') ;
        delete('dataB.nii.gz') ;
        delete('data.nii.gz') ;
    end
    
  else 
    cd([ProgramPath,filesep,'DCM2NII']);
 for i = 1 : length(subj)
       %% change gz to hdr/img and BET in window
       eval([['!' ProgramPath,filesep,'DCM2NII',filesep 'dcm2nii.exe '],...
               [ '-b ' ProgramPath,filesep,'DCM2NII',filesep,'TMSdcm2img.ini'],...
               [' -o ',fullfile(DataDir,'T1Img',subj{i})],' ',...
               [fullfile(DataDir,'T1Img',subj{i},'ac_coT1.nii.gz')]]);
       eval(['!BETWin.exe ',fullfile(DataDir,'T1Img',subj{i},'fac_coT1.img'),' ',fullfile(DataDir,'T1Img',subj{i},'ac_coT1B'),' -f 0.2']);
     %% change hdr/img to nii
       
       [head data] = TMSReadNii(fullfile(DataDir,'T1Img',subj{i},'ac_coT1B.img'));
       TMSWriteNii(reshape(data,head.dim(1),head.dim(2),head.dim(3)),head,fullfile(DataDir,'T1Img',subj{i},'ac_coT1B.nii')); 
       
        gunzip([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii.gz']);
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii'];
        SouData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1B.nii'];
        OtherData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1B.nii'];
        TMScoregister(RefData,SouData,OtherData);
        
        [refhead data] = TMSReadNii(RefData); % added 20220828 to make sure the left and right hemispheres were shown correctly
        [headB dataB] = TMSReadNii(OtherData); % added 20220828
        TMSWriteNii(reshape(dataB,refhead.dim(1),refhead.dim(2),refhead.dim(3)),refhead,OtherData) ; % added 20220828
        
       delete(fullfile(DataDir,'T1Img',subj{i},'ac_coT1B.img'))
       delete(fullfile(DataDir,'T1Img',subj{i},'ac_coT1B.hdr'))
       delete(fullfile(DataDir,'T1Img',subj{i},'fac_coT1.img'))
       delete(fullfile(DataDir,'T1Img',subj{i},'fac_coT1.hdr'))
    end
     cd(DataDir)
  end 
    
    
end

%% Segment T1Img
if get(handles.checkbox14,'value')
    fprintf('Segment T1 image...\n');
    
    for i = 1 : length(subj)
       gunzip([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii.gz']);
       imglist{i,1} = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii,1'] ;
    end
    
    TMSSegDartel(imglist)  ;
    for i = 1 : length(subj)
        SegDirTemp = [DataDir,filesep,'T1Img',filesep,subj{i}] ;
        movefile([SegDirTemp,filesep,'iy_ac_coT1.nii'],[SegDirTemp,filesep,'iy_ac_coT1B.nii']);
        movefile([SegDirTemp,filesep,'y_ac_coT1.nii'],[SegDirTemp,filesep,'y_ac_coT1B.nii']);
    end
    %% QC for segment 
    mkdir([DataDir,filesep,'QC4T1Seg']);
    RefData = [ProgramPath,filesep,'template',filesep,'ch2.nii']  ;
    for i = 1 : length(subj)
       SouData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'wc1ac_coT1.nii'] ;
       imgs = {RefData [SouData]};
       TMSSloverSPM(imgs,[DataDir,filesep,'QC4T1Seg',filesep,subj{i}]) ;
    end  
   
  
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Analysis for FUNCTIONAL data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%% FunRaw to FunImg
if get(handles.checkbox1,'value')
    parfor i = 1 : length(subj)
          mkdir([DataDir,filesep,'FunImg',filesep,subj{i}]) ;
          TMSDicomConvert([DataDir,filesep,inifd,filesep,subj{i}],...
                          [DataDir,filesep,'FunImg',filesep,subj{i}]) ;      
    end
    inifd = 'FunImg' ;
end
%% Delete N time points
if get(handles.checkbox2,'value')
    IniTP = str2num(get(handles.edit2,'string')) ;
    EndTP = str2num(get(handles.edit3,'string')) ;
   parfor i = 1 : length(subj) 
     TempImage = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii*']) ;
     [pathstr, name, ext] = fileparts([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name]) ;
     if strcmp(ext,'.nii')
           [head, data] = TMSReadNii([DataDir, filesep, inifd, filesep, subj{i}, filesep, TempImage(1).name]) ;
     elseif strcmp(ext,'.gz')
         TempImage(1).name
         gunzip([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name]) ;
         [head,data] = TMSReadNii([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name(1:end-3)]) ;
        delete([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name(1:end-3)]) ;
      end
      data = reshape(data,head(1,1).dim(1),head(1,1).dim(2),head(1,1).dim(3),size(data,2)) ;
     
     if EndTP==0 && IniTP==0
         movefile ([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name],...
             [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']) ;
     else
         delete ([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name]);
         data(:,:,:,[IniTP:EndTP])=[];
        TMSWriteNii (data,head, [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']);
     end 
     
     
   end
   % No change for inifd
end

%% AFNI's despike
if get(handles.checkbox3,'value')
    parfor i = 1 : length(subj) 
       mkdir ([DataDir,filesep,[inifd 'D'],filesep,subj{i}])  ;
       [BETPath, fileN, extn] = fileparts(which('TMSBET.sh'));
       cmd = cat(2, 'sh ', [BETPath,filesep], 'WMDespike.sh');
       cd([DataDir,filesep,[inifd 'D'],filesep,subj{i}]) ;
       copyfile([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],...
           'fundata.nii')  ;
       system(cmd)
    end
    inifd = [inifd 'D']
end

%% Slice timing
if get(handles.checkbox4,'value')
    TR = str2num(get( handles.edit4,'string'))
    Order = str2num(get( handles.edit6,'string'))
    Ref = str2num(get( handles.edit5,'string'))
    
    parfor i = 1 : length(subj) 
    TMSSliceTiming([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],...
                   TR,Order,Ref);
    mkdir ([DataDir,filesep,[inifd 'A'],filesep,subj{i}])  ;
    movefile ([DataDir,filesep,inifd,filesep,subj{i},filesep,'afundata.nii'],...
        [DataDir,filesep,[inifd 'A'],filesep,subj{i},filesep,'fundata.nii'])
    end
    inifd = [inifd 'A'] ;
end


%% Realign
if get(handles.checkbox5,'value')
    HeadMotion=zeros(length(subj),20) ;
   parfor i = 1 : length(subj) 
   TMSRealignEW([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']) ;
     
   mkdir([DataDir,filesep,'HMparameter',filesep,subj{i}]) ;
%    rplist =   dir([DataDir,filesep,inifd,filesep,subj{i},filesep,]) ;
%    meanlist = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'meanfundata.nii']) ;
   movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,'rp_fundata.txt'],...
            [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundata.txt']) ;
   movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,'meanfundata.nii'],...
            [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'meanfundata.nii']) ;
   mkdir([DataDir,filesep,[inifd 'R'],filesep,subj{i}]) ;
   movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,'rfundata.nii'],...
            [DataDir,filesep,[inifd 'R'],filesep,subj{i},filesep,'fundata.nii']);
   end
   
   for i =1 : length(subj)
       % save head motion figure
       RP=load([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundata.txt'])  ;
       degreeRP = RP;
       degreeRP(:,4:6) = RP(:,4:6)*180/pi;
       save ([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundataPI.txt'], 'degreeRP', '-ascii') ; %% added 20220708 
       figure;
       plot(degreeRP);
       I=getframe(gcf);
       imwrite (I.cdata,[DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'HeadMotion.bmp']);
       close(figure) ;
    
       [HeadMotion(i,:) FD_Jenkinson FD_VanDijk FD_Power]=HMCalc(...
         [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundata.txt'],...
         [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'meanfundata.nii'])   ;  
     
     save([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'FD_Jenkinson.txt'],...
         'FD_Jenkinson', '-ASCII', '-DOUBLE','-TABS');
     save([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'FD_VanDijk.txt'], ...
         'FD_VanDijk', '-ASCII', '-DOUBLE','-TABS');
     save([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'FD_Power.txt'], ...
         'FD_Power', '-ASCII', '-DOUBLE','-TABS');
  end
        
    %Write the Head Motion as .tsv
        fid = fopen([DataDir,filesep,'HMparameter',filesep,'HeadMotion.tsv'],'w');
        fprintf(fid,'Subject ID\tmax(abs(Tx))\tmax(abs(Ty))\tmax(abs(Tz))\tmax(abs(Rx))\tmax(abs(Ry))\tmax(abs(Rz))\tmean(abs(Tx))\tmean(abs(Ty))\tmean(abs(Tz))\tmean(abs(Rx))\tmean(abs(Ry))\tmean(abs(Rz))\tmean RMS\tmean relative RMS (mean FD_VanDijk)\tmean FD_Power\tNumber of FD_Power>0.5\tPercent of FD_Power>0.5\tNumber of FD_Power>0.2\tPercent of FD_Power>0.2\tmean FD_Jenkinson\n');
        for ss=1:length(subj)
            fprintf(fid,'%s\t',subj{ss});
            fprintf(fid,'%e\t',HeadMotion(ss,:));
            fprintf(fid,'\n');
        end
        fclose(fid);

        
        ExcludeSub_Text=[];
        for ExcludingCriteria=3:-0.5:1
            BigHeadMotion=find(HeadMotion(:,1:6)>ExcludingCriteria);
            if ~isempty(BigHeadMotion)
                [II JJ]=ind2sub(length(subj),BigHeadMotion);
                ExcludeSub=unique(II);
                ExcludeSub_ID=subj(ExcludeSub);
                TempText='';
                for iExcludeSub=1:length(ExcludeSub_ID)
                    TempText=sprintf('%s%s\n',TempText,ExcludeSub_ID{iExcludeSub});
                end
            else
                TempText='None';
            end
            ExcludeSub_Text=sprintf('%s\nExcluding Criteria: %2.1fmm and %2.1f degree in max head motion\n%s\n\n\n',ExcludeSub_Text,ExcludingCriteria,ExcludingCriteria,TempText);
        end
        fid = fopen([DataDir,filesep,'HMparameter',filesep,'ExcludeSubjectsAccordingToMaxHeadMotion.txt'],'at+');
        fprintf(fid,'%s',ExcludeSub_Text);
        fclose(fid);    
   save([DataDir,filesep,'HMparameter',filesep,'HeadMotion.mat'],'HeadMotion');

   inifd = [inifd 'R'] ;
end
        
%% coregister Fun to T1
if get(handles.checkbox6,'value')
    mkdir([DataDir,filesep,'QC4FunCoreg']) ;
    fprintf('coregister functional data to T1 space...\n');
    parfor i = 1 : length(subj)
      if strcmp(subj{i}(end-4:end-1),'_Run')
        mkdir([DataDir,filesep,[inifd 'T'],filesep,subj{i}]) ;
        if exist([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],'file')
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'ac_coT1.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        else
        imglist = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii']);  
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,imglist(1).name],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        end
      else
        mkdir([DataDir,filesep,[inifd 'T'],filesep,subj{i}]) ;
        if exist([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],'file')
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        else
        imglist = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii']);  
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,imglist(1).name],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        end
      end
    end
   inifd = [inifd 'T'] ;
   for i = 1 : length(subj)
      if strcmp(subj{i}(end-4:end-1),'_Run')
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'ac_coT1.nii']  ;
      else
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii']  ;
      end
      SouData = [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']     ;
      
   imgs = {RefData [SouData ',1']};
   TMSSloverSPM(imgs,[DataDir,filesep,'QC4FunCoreg',filesep,subj{i}]) ;
   end
   
end    
  
%% remove covariates
%  get the covarites
if get(handles.checkbox7,'value')
    %% transfer the wm, csf, and wb mask into individual funcitonal space
    ROIlist={};
    for i = 1: length(subj)
       mkdir([DataDir,filesep,'IndiMasks',filesep,subj{i}]) ;
       copyfile([ProgramPath,filesep,'mask',filesep,'CsfMask_07_61x73x61.nii'],...
         [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'CsfMask.nii']) ;
       copyfile([ProgramPath,filesep,'mask',filesep,'WhiteMask_09_61x73x61.nii'],...
         [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'WhiteMask.nii']) ;
       copyfile([ProgramPath,filesep,'mask',filesep,'BrainMask_05_61x73x61.nii'],...
         [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'BrainMask.nii']) ;
       if strcmp(subj{i}(end-4:end-1),'_Run') 
          MATdir = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'iy_ac_coT1B.nii'];
       else
          MATdir = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'iy_ac_coT1B.nii']; 
       end
       TMSwriteDTL(MATdir,[DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'CsfMask.nii']) ;
       TMSwriteDTL(MATdir,[DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'WhiteMask.nii']) ;
       TMSwriteDTL(MATdir,[DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'BrainMask.nii']) ;  
    
    
%     %% preparing Cov signals
    [v Vol4d] = TMSReadNii([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']);
    Vol4d(isnan(Vol4d))=0;
    dim1=v(1).dim(1) ;  dim2=v(1).dim(2);  dim3 = v(1).dim(3) ;
    TMSWriteNii (reshape(Vol4d(:,1),dim1,dim2,dim3),v,...
        [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']) ;
    
       % prepare constant and linear regressors
       ConstantLinear =(1:size(Vol4d,2))';
       ConstantLinear1 =repmat(ConstantLinear, [1, 2]);
       ConstantLinear1(:, 1) =1 ;
         
       % prepare head motion, wm, csf, and gs
      if get(handles.radiobutton1,'value')
         HM6   = load(...
             [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundata.txt']) ;
         HM24 = [HM6, [zeros(1,size(HM6,2));HM6(1:end-1,:)], HM6.^2, [zeros(1,size(HM6,2));HM6(1:end-1,:)].^2];
%          Covs= [Covs HM24];
      else
         HM24=[];
      end
 
      if get(handles.radiobutton4,'value')
         fprintf('\n\tFor extracting white matter signal...\n');
         wmDir = [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'wWhiteMask.nii'];
         [wmv wmdata] = TMSReadNii(wmDir) ;
         ResVol=TMSreslice([DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']...
             ,wmDir,[DataDir,filesep,'IndiMasks',filesep,subj{i}]);
         ResVol1=reshape(ResVol,dim1*dim2*dim3,1);
         for j = 1  : size(v,1)
             wmSignal(j,1) = mean(Vol4d(find(ResVol1),j)) ;
         end
      else
         wmSignal=[];
      end

      if get(handles.radiobutton2,'value')
         fprintf('\n\tFor extracting CSF signal...\n');
         csfDir = [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'wCsfMask.nii'];
         ResVol=TMSreslice([DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']...
             ,csfDir,[DataDir,filesep,'IndiMasks',filesep,subj{i}]);
         ResVol1=reshape(ResVol,dim1*dim2*dim3,1);
         for j = 1  : size(v,1)
             csfSignal(j,1) = mean(Vol4d(find(ResVol1),j)) ;
         end
      else
          csfSignal=[];
      end

      if get(handles.radiobutton3,'value')
         fprintf('\n\tFor extracting global signal...\n');
         gsDir = [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'wBrainMask.nii'];
         ResVol=TMSreslice([DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']...
             ,gsDir,[DataDir,filesep,'IndiMasks',filesep,subj{i}]);
         ResVol1=reshape(ResVol,dim1*dim2*dim3,1);
         
         for j = 1  : size(v,1)
             gsSignal(j,1) = mean(Vol4d(find(ResVol1),j)) ; 
         end
      else
          gsSignal=[];
      end

    Covs = [ConstantLinear1 HM24 csfSignal wmSignal gsSignal] ;
    Covs(:,2:end) = (Covs(:,2:end)-repmat(mean(Covs(:,2:end)),size(Covs,1),1)); %YAN Chao-Gan, 20160415. Demean, then the constant models the mean. At the end, could add the mean back.

fprintf('\n\t Covariates preparation Done...\n');

% load mask and regress our Covs
    gsDir = [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'wBrainMask.nii'];
    MaskVol=TMSreslice([DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']...
             ,gsDir,[DataDir,filesep,'IndiMasks',filesep,subj{i}]);
    MaskVol1=reshape(MaskVol,dim1*dim2*dim3,1);
    OutVol4 = zeros(size(Vol4d)); MeanBrain=zeros(dim1*dim2*dim3,1);
    fprintf('\n\t Regressing out Covs...\n');  subj{i}
    parfor ii =1 : size(MaskVol1,1)
        if MaskVol1(ii,1)
        DependentVariable=squeeze(Vol4d(ii,:));
        [b,r] = TMSregression(DependentVariable',Covs);
        OutVol4(ii,:)=r;
        MeanBrain(ii,1)=b(1);
        end
    end
%   mean(MeanBrain)
  OutVol4=OutVol4+repmat(MeanBrain,[1,size(OutVol4,2)]);
% output the regressed image
    mkdir([DataDir,filesep,[inifd 'C'],filesep,subj{i}]) ;
    TMSWriteNii(reshape(OutVol4,dim1,dim2,dim3,size(OutVol4,2)),v,...
        [DataDir,filesep,[inifd 'C'],filesep,subj{i},filesep,'fundata.nii']) ;   
    save([DataDir,filesep,[inifd 'C'],filesep,subj{i},filesep,'Covs'], 'Covs')
    clear Vol4d OutVol4 Covs ConstantLinear1 HM24 csfSignal wmSignal gsSignal
    end
 inifd=[inifd 'C'];
end

 %% Smooth functioanl data
if get (handles.checkbox8,'value')
    kernal=str2num(get(handles.edit7,'string'));
    parfor i = 1 :  length(subj)
        mkdir([DataDir,filesep,[inifd 'S'],filesep,subj{i}]) ;
        TMSsmooth([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],kernal ) ;
        movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,'sfundata.nii'],...
            [DataDir,filesep,[inifd 'S'],filesep,subj{i},filesep,'fundata.nii']) ;
    end
    inifd = [inifd 'S']
fprintf('\n\t Spatial smooth compeleted.\n'); 
end

%% Filter
if get (handles.checkbox9,'value')
    lowcut = str2num(get(handles.edit8,'string')) ;
    highcut = str2num(get(handles.edit9,'string')) ;
    TR = str2num(get(handles.edit4,'string'))  ;
    [v Vol4d] = TMSReadNii([DataDir,filesep,inifd,filesep,subj{1},filesep,'fundata.nii']);
    dim1 = v(1,1).dim(1) ; dim2 = v(1,1).dim(2) ; dim3 = v(1,1).dim(3) ;
    
    parfor i = 1 :  length(subj)
        mkdir([DataDir,filesep,[inifd 'F'],filesep,subj{i}]) ;
        [headf,fundata] = TMSReadNii ([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']) ;
%         
         [v maskdata]  = TMSReadNii ([DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'rwBrainMask.nii']) ;
         maskdata(find( maskdata)) = 1 ;
        
        AllVolume = TMSfilter(fundata,reshape(maskdata,dim1*dim2*dim3,1),TR,lowcut, highcut) ;
        TMSWriteNii(reshape(AllVolume,headf(1,1).dim(1),headf(1,1).dim(2),headf(1,1).dim(3),size(fundata,2)),headf,...
                    [DataDir,filesep,[inifd 'F'],filesep,subj{i},filesep,'fundata.nii']) ;
    end
    inifd = [inifd 'F'] ;
fprintf('\n\t Filter completed.\n'); 
end

%% Merge multi-runs
if get (handles.ckbM,'value')
    cd(DataDir)
    mkdir([inifd 'M']);
    i=1; 
    
    while i <= length(subj) 
       
       if strcmp(subj{i}(end-4:end-1),'_Run')
             RunList =  dir([inifd,filesep,subj{i}(1:end-5),'_Run*']) 
            
             %% These were added for align the head information of
             %% multi-runs; Transfer to MNI and then transform back to T1
             %% space
             MATdir = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'y_ac_coT1B.nii']
             MATdirInv = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'iy_ac_coT1B.nii']
             ImgDir= [inifd,filesep,RunList(1).name,filesep,'fundata.nii'];
             TMSwriteDTL(MATdir,ImgDir) ;
             TMSwriteDTL(MATdirInv,[inifd,filesep,RunList(1).name,filesep,'wfundata.nii']) ;
             delete([inifd,filesep,RunList(1).name,filesep,'wfundata.nii']) ;
             delete([inifd,filesep,RunList(1).name,filesep,'fundata.nii']) ;
             movefile([inifd,filesep,RunList(1).name,filesep,'wwfundata.nii'],...
                      [inifd,filesep,RunList(1).name,filesep,'fundata.nii']) ;
             %%
             
             [head3 data3] = TMSReadNii([inifd,filesep,RunList(1).name,filesep,'fundata.nii']) ;
             data3=(data3-repmat(mean(data3')',[1,size(data3,2)]));
             for c = 2 :  length(RunList) % joint all sessions   
                 
             %% These were added for align the head information of
             %% multi-runs; Transfer to MNI and then transform back to T1
             %% space
                 ImgDir= [inifd,filesep,RunList(c).name,filesep,'fundata.nii'];
                 TMSwriteDTL(MATdir,ImgDir) ;
                 TMSwriteDTL(MATdirInv,[inifd,filesep,RunList(c).name,filesep,'wfundata.nii']) ;
                 delete([inifd,filesep,RunList(c).name,filesep,'wfundata.nii']) ;
                 delete([inifd,filesep,RunList(c).name,filesep,'fundata.nii']) ;
                 movefile([inifd,filesep,RunList(c).name,filesep,'wwfundata.nii'],...
                          [inifd,filesep,RunList(c).name,filesep,'fundata.nii']) ;
             %%
                 
                 
                [head4 data4] = TMSReadNii([inifd,filesep,RunList(c).name,filesep,'fundata.nii']) ;
                data4=(data4-repmat(mean(data4')',[1,size(data4,2)]));
                data3 = [data3 data4] ;
                head3 = [head3 ; head4] ;
                
             end 
             mkdir([[inifd 'M'],filesep,subj{i}(1:end-5)]);
             TMSWriteNii(reshape(data3,head3(1).dim(1),head3(1).dim(2),head3(1).dim(3),size(data3,2)),head3,...
                        [[inifd 'M'],filesep,subj{i}(1:end-5),filesep,'fundata.nii']);
                    
                    
             clear data3 data4      
             i = i + length(RunList);
       else
           
           mkdir([[inifd 'M'],filesep,subj{i}]);
           copyfile([inifd,filesep,subj{i},filesep,'fundata.nii'],...
               [[inifd 'M'],filesep,subj{i},filesep,'fundata.nii']) ;
           i=i+1;
       end
     end
    
    inifd = [inifd 'M'] ;
end

    %% computing FC

   FCMaskDir = get( handles.edit11,'String') ;
   SeedDir = get( handles.edit10,'String') ;
   FCOutDir = get( handles.edit12,'String');
   VoxThr = str2num(get(handles.edit13,'string')) ;
   PosNegIn = get(handles.edit14,'string') ;
   TargetDepth = str2num(get(handles.edit15,'string')) ;
   
  if get(handles.checkbox17,'value')
    subj = dir([DataDir,filesep,inifd]);
    for i = 3 : length(subj)
      TMSSeedFC(SeedDir,FCMaskDir,FCOutDir,[DataDir,filesep,inifd],subj(i).name,TargetDepth);
%       if strcmp(subj(i).name(end-4:end-1),'_Run') 
%           subjnew = subj(i).name(1:end-5);
%       else
          subjnew = subj(i).name;
%       end
      MATdir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'y_ac_coT1B.nii']; 
      invMatDir = [DataDir,filesep,'T1Img',filesep,subjnew,filesep,'iy_ac_coT1B.nii']; 
      TMSwriteDTL(MATdir,[FCOutDir,filesep,subjnew,filesep,'SeedFCinROI.nii']) ;
      TMSwriteDTL(MATdir,[FCOutDir,filesep,subjnew,filesep,'SeedFCinWB.nii']) ;
      movefile([FCOutDir,filesep,subjnew,filesep,'wSeedFCinROI.nii'],[FCOutDir,filesep,subjnew,filesep,'SeedFCinROI_MNI.nii'])   
      movefile([FCOutDir,filesep,subjnew,filesep,'wSeedFCinWB.nii'],[FCOutDir,filesep,subjnew,filesep,'SeedFCinWB_MNI.nii'])   
    end
    
    
    [AX inifdRes BX] = fileparts(FCOutDir);  
  end
  
  %% Calculating target based the FC maps
    if get(handles.checkbox18,'value') % Calculating target site
        
        if strcmp(PosNegIn,'Both')
          PosNeg = {'Positive','Negative'};
        else
          PosNeg = {PosNegIn}
        end
        
        subj = dir([DataDir,filesep,inifd]);
      for i = 3 : length(subj)
          if ~strcmp(subj(i).name(end-4:end-1),'_Run')
             TMSTargetSite([DataDir,filesep,'T1Img'],...
              [DataDir,filesep,inifdRes],subj(i).name,PosNeg,VoxThr);
         
      end
      
end


    end
   






% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
[seedname seeddir] = uigetfile('*.nii');
if seedname
set(handles.edit10,'string',[seeddir,seedname])
end

function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton4_Callback(hObject, eventdata, handles)
[maskname maskdir] = uigetfile('*.nii');
if maskname
set(handles.edit11,'string',[maskdir,maskname])
end

function edit11_Callback(hObject, eventdata, handles)
function edit11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton5_Callback(hObject, eventdata, handles)
outdir = uigetdir;
if outdir
set(handles.edit12,'string',outdir)
end

function edit12_Callback(hObject, eventdata, handles)
function edit12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton3_CreateFcn(hObject, eventdata, handles)
function pushbutton4_CreateFcn(hObject, eventdata, handles)
function pushbutton5_CreateFcn(hObject, eventdata, handles)
function checkbox15_Callback(hObject, eventdata, handles)
function checkbox16_Callback(hObject, eventdata, handles)
function checkbox15_CreateFcn(hObject, eventdata, handles)
function checkbox16_CreateFcn(hObject, eventdata, handles)
function edit13_Callback(hObject, eventdata, handles)
function edit13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit14_Callback(hObject, eventdata, handles)
function edit14_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
if get(handles.checkbox18,'value')
    set(handles.text13,'enable','on')
    set(handles.edit13,'enable','on')
    set(handles.text14,'enable','on')
    set(handles.edit14,'enable','on')
else
    set(handles.text13,'enable','off')
    set(handles.edit13,'enable','off')
    set(handles.text14,'enable','off')
    set(handles.edit14,'enable','off')
end

function checkbox17_Callback(hObject, eventdata, handles)
if get(handles.checkbox17,'value')
        set(handles.edit15,'enable','on')
%         set(handles.edit14,'enable','on')
        set(handles.text15,'enable','on')
%          set(handles.text14,'enable','on')
else
    set(handles.edit15,'enable','off')
    set(handles.text15,'enable','off')
%     set(handles.edit14,'enable','off')
%     set(handles.text14,'enable','off')
end
function checkbox17_CreateFcn(hObject, eventdata, handles)


function edit15_Callback(hObject, eventdata, handles)
function edit15_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit16_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ckbM.
function ckbM_Callback(hObject, eventdata, handles)
