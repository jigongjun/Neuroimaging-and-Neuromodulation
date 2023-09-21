function varargout = WhiteMatter(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WhiteMatter_OpeningFcn, ...
                   'gui_OutputFcn',  @WhiteMatter_OutputFcn, ...
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
function WhiteMatter_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

set(handles.figure1,'outerposition',[8 1 650 600],'color',[0.94 0.94 0.94])
movegui(hObject,'center')

set(handles.text1,'string','White Matter Structure and Function','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',0.8,'unit','normalized','pos',[0.14 0.95 0.72 0.04])
set(handles.uipanel13,'title','Function','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',10,'unit','normalized','pos',[0.04 0.08 0.45 0.8])
set(handles.uipanel12,'title','Structure','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',10,'unit','normalized','pos',[0.50 0.08 0.22 0.8])
set(handles.uipanel10,'title','Diffusion','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',10,'unit','normalized','pos',[0.73 0.08 0.22 0.8])
set(handles.phbRUN,'string','Run','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 1],'fontsize',0.5,'unit','normalized','pos',[0.83 0.03 0.12 0.05])
set(handles.text2,'string','Data Dir','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.1 0.9 0.2 0.04])
set(handles.editWorkDir,'backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.26 0.905 0.5 0.04])
set(handles.phbWorkDir,'string','...','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.8,'unit','normalized','pos',[0.77 0.905 0.07 0.04])


set(handles.ckbFunDCM2NII,'string','DCM2NII','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.94 0.4 0.06])
set(handles.ckbDelNTP,'string','Delete','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.89 0.28 0.06])
set(handles.editIniTP,'string','1','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.38 0.9 0.1 0.04])
set(handles.editEndTP,'string','5','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.55 0.9 0.1 0.04])
set(handles.text33,'string','-','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.7,'unit','normalized','pos',[0.48 0.9 0.07 0.03])
set(handles.ckbDspk,'string','Despike','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.84 0.3 0.06])
set(handles.text34,'string','D','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.03 0.84 0.03 0.04])

set(handles.ckbSliceTiming,'string','SliTim','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.79 0.3 0.06])
              
set(handles.text5,'string','TR','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.38 0.79 0.07 0.04])
set(handles.editTRs,'string','2.4','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.46 0.8 0.1 0.04])
set(handles.text7,'string','Ref','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.58 0.79 0.07 0.04])
set(handles.editRefVol,'string','45','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.67 0.8 0.1 0.04])
set(handles.text22,'string','A','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.03 0.79 0.03 0.04])
set(handles.text6,'string','Order','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.38 0.74 0.15 0.04])
set(handles.editOrder,'string','[1:2:45,2:2:46]','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.54 0.75 0.4 0.04])
              
              
set(handles.ckbRealign,'string','Realign','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.7 0.3 0.06])
set(handles.text23,'string','R','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.03 0.70 0.03 0.04])

set(handles.ckbFun2T1,'string','Coregistration','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.65 0.5 0.06])
set(handles.rdbFunQC,'string','QC','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.4,'unit','normalized','pos',[0.5 0.65 0.3 0.06])
set(handles.text24,'string','T','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.03 0.65 0.03 0.04])
              
set(handles.ckbCovReg,'string','CovReg','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.60 0.3 0.06])
set(handles.text25,'string','C','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.03 0.60 0.03 0.04])
set(handles.rdbHMFriston24,'string','HM','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.35 0.61 0.15 0.04])
set(handles.rdbCSF,'string','CSF','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.5 0.61 0.15 0.04])
set(handles.rdbGS,'string','GS','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.67 0.61 0.15 0.04])
set(handles.rdbWM,'string','WM','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.81 0.61 0.15 0.04])
set(handles.text10,'string','--->','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.81 0.65 0.16 0.04])
              
set(handles.text26,'string','wm','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',9,'unit','normalized','pos',[0.01 0.57 0.06 0.03])
set(handles.text30,'string','gm','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',9,'unit','normalized','pos',[0.01 0.54 0.06 0.03])
set(handles.ckbFunSeg,'string','Segment','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.54 0.3 0.06])
set(handles.editIndiGThr,'string','0.1','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.4 0.55 0.1 0.04])
set(handles.editIndiWThr,'string','0.9','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.54 0.55 0.1 0.04])
set(handles.text20,'string','/','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.9,'unit','normalized','pos',[0.51 0.55 0.02 0.04])
              
set(handles.text27,'string','S','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.03 0.49 0.03 0.04])
set(handles.ckbFunSmooth,'string','Smooth','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.49 0.3 0.06])
set(handles.edit7,'string','4','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.5,'unit','normalized','pos',[0.4 0.5 0.1 0.04])

set(handles.ckbFunFilter,'string','Filter','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.44 0.3 0.06])
set(handles.ckbM,'string','Merge','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.39 0.3 0.06])
set(handles.editLowCut,'string','0.01','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.4 0.45 0.13 0.04])
set(handles.editHighCut,'string','0.1','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.57 0.45 0.1 0.04])
set(handles.text8,'string','-','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.9,'unit','normalized','pos',[0.54 0.45 0.02 0.04])
set(handles.text28,'string','F','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.03 0.44 0.03 0.04])
set(handles.text38,'string','M','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.028 0.39 0.03 0.04])

set(handles.text31,'string','Measures','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.5,'unit','normalized','pos',[0.022 0.33 0.3 0.06])
set(handles.ppmMask,'backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.25,'unit','normalized','pos',[0.33 0.29 0.5 0.1])

set(handles.rbdFunALFF,'string','ALFF','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.7,'unit','normalized','pos',[0.07 0.29 0.3 0.04])
              
set(handles.text32,'string','Derivative','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.5,'unit','normalized','pos',[0.025 0.22 0.31 0.06])
set(handles.editVar,'string','ALFF','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.5,'unit','normalized','pos',[0.35 0.24 0.28 0.04])
              
set(handles.rbdFunAFQ,'string','AFQ','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.7,'unit','normalized','pos',[0.07 0.18 0.3 0.04])

set(handles.ckbFun2MNI,'string','Spatial Normalization','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.07 0.09 0.8 0.06])
              
set(handles.ppmFunSpaNor,'backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.25,'unit','normalized','pos',[0.135 0.045 0.6 0.1])
set(handles.text29,'string','W','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.7,'unit','normalized','pos',[0.025 0.1 0.04 0.03])
               
set(handles.text16,'string','Cores','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',11,'unit','normalized','pos',[0.04 0.05 0.08 0.03])
set(handles.editCore,'string','0','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.7,'unit','normalized','pos',[0.13 0.05 0.05 0.03])
%% T1 SETTING
set(handles.ckbT1DCM2NII,'string','DCM2NII','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.94 0.6 0.06])
set(handles.ckbReorient,'string','Reorient','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.89 0.6 0.06])
set(handles.ckbBET,'string','BET','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.65 0.4 0.06])
set(handles.ckbT1Seg,'string','Segment','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.55 0.55 0.06])
set(handles.rdbT1QC,'string','QC','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.4,'unit','normalized','pos',[0.7 0.55 0.3 0.06])
set(handles.text11,'string','<--','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.00 0.55 0.15 0.04])
set(handles.ckbGmask,'string','GroupMask','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.47 0.7 0.06])

set(handles.editGroupGThr,'string','0.1','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.26 0.42 0.22 0.04])
set(handles.text21,'string','/','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.48 0.41 0.08 0.05])
set(handles.editGroupWThr,'string','0.9','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.57 0.42 0.22 0.04])
              
%% diffusion setting
set(handles.ckbDTIDCM2NII,'string','DCM2NII','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.94 0.6 0.06])
set(handles.ckbDTITopup,'string','Topup','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.88 0.6 0.06])
set(handles.ckbDTIBET,'string','BET','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.82 0.6 0.06])
set(handles.ckbDTI2T1,'string','Coreg','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.65 0.7 0.06])
set(handles.rdbDiffQC,'string','QC','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.4,'unit','normalized','pos',[0.6 0.65 0.3 0.06])

set(handles.ckbEddy,'string','Eddy Corr','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.55 0.8 0.06])
set(handles.text14,'string','<--','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.6,'unit','normalized','pos',[0.00 0.65 0.15 0.04])
set(handles.ckbDTIFiting,'string','Tensor Fitting','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.48 0.8 0.06])
set(handles.ckbDTIAFQ,'string','AFQ','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.41 0.8 0.06])
set(handles.ckbDTITBSS,'string','TBSS','backgroundcolor',[0.94 0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.47,'unit','normalized','pos',[0.16 0.35 0.4 0.06])
set(handles.rdbDTIQC,'string','QC','backgroundcolor',[0.94  0.94 0.94],...
                  'ForegroundColor',[0 0 0],'fontsize',0.52,'unit','normalized','pos',[0.55 0.415 0.3 0.05])






              
guidata(hObject, handles);
function ckbReorient_Callback(hObject, eventdata, handles)
function ckbFun2T1_Callback(hObject, ~, handles)
function varargout = WhiteMatter_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function editWorkDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ckbRealign_Callback(hObject, eventdata, handles)
function checkbox4_Callback(hObject, eventdata, handles)
function checkbox5_Callback(hObject, eventdata, handles)
function ckbFunSmooth_Callback(hObject, eventdata, handles)
function ckbFunFilter_Callback(hObject, eventdata, handles)
function ckbSliceTiming_Callback(hObject, eventdata, handles)
function ckbT1Seg_Callback(hObject, eventdata, handles)
function ckbT1DCM2NII_Callback(hObject, eventdata, handles)
function editTRs_Callback(hObject, eventdata, handles)
function editTRs_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editOrder_Callback(hObject, eventdata, handles)
str2num(get( handles.editOrder,'string')) ;
function editOrder_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editRefVol_Callback(hObject, eventdata, handles)
function editRefVol_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editLowCut_Callback(hObject, eventdata, handles)
function editLowCut_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editHighCut_Callback(hObject, eventdata, handles)
function editHighCut_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function rdbHMFriston24_Callback(hObject, eventdata, handles)
function rdbWM_Callback(hObject, eventdata, handles)
function rdbCSF_Callback(hObject, eventdata, handles)
function edit7_Callback(hObject, eventdata, handles)
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ckbDTIDCM2NII_Callback(hObject, eventdata, handles)
function ckbEddy_Callback(hObject, eventdata, handles)
function ckbDTIBET_Callback(hObject, eventdata, handles)
function ckbDTIFiting_Callback(hObject, eventdata, handles)
function checkbox17_Callback(hObject, eventdata, handles)
function radiobutton5_Callback(hObject, eventdata, handles)
function radiobutton6_Callback(hObject, eventdata, handles)
function ckbDTIAFQ_Callback(hObject, eventdata, handles)
function ckbDTITBSS_Callback(hObject, eventdata, handles)
function ckbFunSeg_Callback(hObject, eventdata, handles)

function ckbFunMeasures_Callback(hObject, eventdata, handles)
function checkbox25_Callback(hObject, eventdata, handles)
function checkbox26_Callback(hObject, eventdata, handles)
function ckbDTI2T1_Callback(hObject, eventdata, handles)
function checkbox28_Callback(hObject, eventdata, handles)
function checkbox29_Callback(hObject, eventdata, handles)
function editWorkDir_Callback(hObject, eventdata, handles)
function editCore_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rdbGS_Callback(hObject, eventdata, handles)
function ckbDelNTP_Callback(hObject, eventdata, handles)
function ckbFunDCM2NII_Callback(hObject, eventdata, handles)
function ckbBET_Callback(hObject, eventdata, handles)
function editInifd_Callback(hObject, eventdata, handles)
function editInifd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editIniTP_Callback(hObject, eventdata, handles)
function editIniTP_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editIndiGThr_Callback(hObject, eventdata, handles)
function editIndiGThr_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editGroupGThr_Callback(hObject, eventdata, handles)
function editGroupGThr_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editIndiWThr_Callback(hObject, eventdata, handles)
function editIndiWThr_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editGroupWThr_Callback(hObject, eventdata, handles)
function editGroupWThr_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ckbCovReg_Callback(hObject, eventdata, handles)
   if get( handles.ckbCovReg,'value')
       set(handles.rdbHMFriston24,'value',1) ;
       set(handles.rdbCSF,'value',1) ;
       set(handles.rdbWM,'value',1) ;
       set(handles.rdbGS,'value',1) ;
   else
       set(handles.rdbHMFriston24,'value',0) ;
       set(handles.rdbCSF,'value',0) ;
       set(handles.rdbWM,'value',0) ;
       set(handles.rdbGS,'value',0) ;
       
   end
   
function editCore_Callback(hObject, eventdata, handles)
 v = version;
 NCore = str2num(get(handles.editCore,'string'))
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
    pgcp = gcp('nocreate')
    if NCore>0 && isempty(pgcp) 
      parpool (NCore) 
   elseif NCore>0 && ~isempty(pgcp) 
      delete(gcp('nocreate'))
      parpool (NCore) 
    end
   
end

function ckbFun2MNI_Callback(hObject, eventdata, handles)
if get(handles.ckbFun2MNI,'Value') ;
   set(handles.ppmFunSpaNor,'Visible','on') 
else
   set(handles.ppmFunSpaNor,'Visible','off') 
end

function ppmFunSpaNor_Callback(hObject, eventdata, handles)
SpaNorVal = get(handles.ppmFunSpaNor,'Value') ;
switch SpaNorVal
    case 1
       fprintf('\n\t Translating the images into MNI space...\n');
    case 2
       fprintf('\n\t Translating the images into Individual space...\n');
end


function phbWorkDir_Callback(hObject, eventdata, handles)
% AnalysisDir = spm_select(1,'dir','please the folder contain subfolder like FunRaw')
AnalysisDir = uigetdir;
[DataDir,inifd,cc] = fileparts (AnalysisDir) 
    if ischar(DataDir),
		set(handles.editWorkDir,'String',AnalysisDir) ;
    end
    
    if ~exist ([DataDir,filesep,'SubjList.txt'],'file')
       ListSubj(AnalysisDir);
    else   
       answ = questdlg ('Refresh the list for processing?') ; 
       if strcmp(answ,'Yes')
          delete([DataDir,filesep,'SubjList.txt']);
          ListSubj(AnalysisDir);
       end
    end
    
% --- Executes on button press in phbRUN.
function phbRUN_Callback(hObject, eventdata, handles)
AnalysisDir = get(handles.editWorkDir,'String');
[DataDir,inifd,cc] = fileparts (AnalysisDir) 
[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'));
subj = importdata([DataDir,filesep,'SubjList.txt']) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Analysis for STRUCTURAL data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%% T1Raw to T1Img
if get(handles.ckbT1DCM2NII,'value')
    parfor i = 1 : length(subj)
        mkdir([DataDir,filesep,'T1Img',filesep,subj{i}]) ;
        TMSDicomConvert([DataDir,filesep,'T1Raw',filesep,subj{i}],...
                        [DataDir,filesep,'T1Img',filesep,subj{i}]) ; 
    end
   
end

%% Reorient T1Img
if get(handles.ckbReorient,'value')
    for i = 1 : length(subj)
       tempimg = dir([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'co*'])
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
if get(handles.ckbBET,'value')
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
if get(handles.ckbT1Seg,'value')
    fprintf('Segment T1 image...\n');
    for i = 1 : length(subj)
        gunzip([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii.gz']) ;
       imglist{i,1} = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii,1'] ;
    end
    
    TMSSegDartel(imglist)  ;
    GMSegThr= str2num( get(handles.editIndiGThr,'String')) ;    % probability threshold from segmentation
    WMSegThr= str2num( get(handles.editIndiWThr,'String')) ;
    
    for i = 1 : length(subj)
        SegDirTemp = [DataDir,filesep,'T1Img',filesep,subj{i}] ;
        movefile([SegDirTemp,filesep,'iy_ac_coT1.nii'],[SegDirTemp,filesep,'iy_ac_coT1B.nii']);
        movefile([SegDirTemp,filesep,'y_ac_coT1.nii'],[SegDirTemp,filesep,'y_ac_coT1B.nii']);
          
    if ~exist([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'wHOAsub25prob.nii'],'file')
         copyfile([ProgramPath '/mask/HOAsub25prob.nii'],...
            [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'HOAsub25prob.nii']) ;
                 
        MATdir = [SegDirTemp,filesep,'iy_ac_coT1B.nii'];
        ROIlist= [SegDirTemp,filesep,'HOAsub25prob.nii'];
        TMSwriteDTL(MATdir,ROIlist) ;
    end
    end
end

if get(handles.rdbT1QC,'value')
%% QC for segment
    mkdir([DataDir,filesep,'QC4T1Seg']);
    RefData = [ProgramPath,filesep,'template',filesep,'ch2.nii']  ;
    for i = 1 : length(subj)
       SouData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'wc1ac_coT1.nii'] ;
       imgs = {RefData [SouData]};
       TMSSloverSPM(imgs,[DataDir,filesep,'QC4T1Seg',filesep,subj{i}]) ;
    end  
end

%% Produce group mask for WM and GM
if get(handles.ckbGmask,'value')
    
    WMGroupThr= str2num(get(handles.editGroupWThr,'String')) ;
    GMGroupThr= str2num(get(handles.editGroupGThr,'String')) ;
    mkdir([DataDir,filesep,'GroupMask']) ;

    parfor i = 1 : length(subj)
%       MATdir = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'y_ac_coT1B.nii'];
      [wmhead wmdata(:,i)] = TMSReadNii([DataDir,filesep,'T1Img',filesep,subj{i},...
          filesep,'wc2ac_coT1.nii']);
      [gmhead gmdata(:,i)] = TMSReadNii([DataDir,filesep,'T1Img',filesep,subj{i},...
          filesep,'wc1ac_coT1.nii']);
    end
    GMSegThr= str2num( get(handles.editIndiGThr,'String')) ;
    WMSegThr= str2num( get(handles.editIndiWThr,'String')) ;
    gmdata(find(gmdata>GMSegThr)) = 1 ;  gmdata(find(gmdata<1)) = 0 ;
    wmdata(find(wmdata>WMSegThr)) = 1 ;  wmdata(find(wmdata<1)) = 0 ;
    
    [wmhead datatemp] = TMSReadNii([DataDir,filesep,'T1Img',filesep,subj{1},...
                                       filesep,'wc2ac_coT1.nii']); % JUST for head info
    wmdata = sum(reshape(wmdata,wmhead(1,1).dim(1),wmhead(1,1).dim(2),wmhead(1,1).dim(3),size(wmdata,2)),4)/size(wmdata,2)  ;                     
    gmdata = sum(reshape(gmdata,wmhead(1,1).dim(1),wmhead(1,1).dim(2),wmhead(1,1).dim(3),size(gmdata,2)),4)/size(gmdata,2)  ;                     
    TMSWriteNii(wmdata,wmhead,[DataDir,filesep,'GroupMask',filesep,'WMprob.nii']) ;
    TMSWriteNii(gmdata,wmhead,[DataDir,filesep,'GroupMask',filesep,'GMprob.nii']) ;
    
    gmdata(find(gmdata>GMGroupThr)) = 1 ;  gmdata(find(gmdata<1)) = 0 ;
    wmdata(find(wmdata>WMGroupThr)) = 1 ;  wmdata(find(wmdata<1)) = 0 ;
   
    TMSWriteNii(wmdata,wmhead,...
        [DataDir,filesep,'GroupMask',filesep,['WMprob' num2str(WMGroupThr*100) '.nii']]) ;
    TMSWriteNii(gmdata,wmhead,...
        [DataDir,filesep,'GroupMask',filesep,['GMprob' num2str(GMGroupThr*100) '.nii']]) ;
    
fprintf('Group-level mask has been saved in the folder: GroupMask.\n'); 

    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Analysis for DIFFUSION data %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DTIRaw to DTIImg
    [BETPath, fileN, extn] = fileparts(which('TMSBET.sh'));

if get(handles.ckbDTIDCM2NII,'value')
    parfor i = 1 : length(subj)
        mkdir([DataDir,filesep,'DTIImg',filesep,subj{i}]) ;
        TMSDicomConvert([DataDir,filesep,'DTIRaw',filesep,subj{i}],...
                        [DataDir,filesep,'DTIImg',filesep,subj{i}]) ; 
        TempImage = dir ([DataDir,filesep,'DTIImg',filesep,subj{i}]) ;
        movefile([DataDir,filesep,'DTIImg',filesep,subj{i},filesep,TempImage(3).name],...
            [DataDir,filesep,'DTIImg',filesep,subj{i},filesep,'bval']) ;
        movefile([DataDir,filesep,'DTIImg',filesep,subj{i},filesep,TempImage(4).name],...
            [DataDir,filesep,'DTIImg',filesep,subj{i},filesep,'bvec']) ;
        movefile([DataDir,filesep,'DTIImg',filesep,subj{i},filesep,TempImage(5).name],...
            [DataDir,filesep,'DTIImg',filesep,subj{i},filesep,'data.nii']) ;
        delete([DataDir,filesep,'DTIImg',filesep,subj{i},filesep,TempImage(3).name]);
        delete([DataDir,filesep,'DTIImg',filesep,subj{i},filesep,TempImage(4).name]);
        delete([DataDir,filesep,'DTIImg',filesep,subj{i},filesep,TempImage(5).name]);
    end
end
    %% Add topup; combine two DTI data with different phase encoding
    %% direction. Changed in 2023/09/15 by JGJ
if get(handles.ckbDTITopup,'value')
    cd([DataDir,filesep,'DTIImg']);
    for i = 1 : 2 : length(subj) % each subject has two files
         [headap dataap]= TMSReadNii([subj{i},filesep,'data.nii']) ;
         [headpa datapa]= TMSReadNii([subj{i+1},filesep,'data.nii']) ;
         TMSWriteNii(reshape([dataap(:,1) datapa(:,1)],...
             headap(1,1).dim(1),headap(1,1).dim(2),headap(1,1).dim(3),2),...
             headap,[subj{i},filesep,'data_appa_b0.nii']);
         copyfile([subj{i+1},filesep,'data.nii'],[subj{i},filesep,'datapa.nii']) ;
         copyfile( [BETPath,filesep,'para.txt'],[subj{i},filesep,'para.txt'] ) ;
         copyfile( [BETPath,filesep,'b02b0.cnf'],[subj{i},filesep,'b02b0.cnf'] ) ;
      
        cmd = cat(2, 'sh ', [BETPath,filesep], 'topup.sh');
        cd([subj{i}]) ;
        system(cmd)
        gunzip(['my_hifi_data.nii.gz']);
        delete(['my_hifi_data.nii.gz']);
        delete(['datapa.nii']);
        
        cd([DataDir,filesep,'DTIImg']);
        mkdir(subj{i}(1:end-3)) ;
        movefile([subj{i},filesep,'my_hifi_data.nii'],[subj{i}(1:end-3),filesep,'data.nii']) ;
        copyfile( [subj{i},filesep,'bval'], [subj{i}(1:end-3),filesep,'bval']) ;
        copyfile( [subj{i},filesep,'bvec'],[subj{i}(1:end-3),filesep,'bvec'] ) ;

    end
  
end

%% DTI bet
if get(handles.ckbDTIBET,'value')
    fprintf('BET the diffusion image...\n');
    parfor i = 1 : length(subj)
        cmd = cat(2, 'sh ', [BETPath,filesep], 'TMSBET.sh');
        cd([DataDir,filesep,'DTIImg',filesep,subj{i}]) ;
        system(cmd)
        gunzip('dataB.nii.gz') ;
        delete('dataB.nii.gz') ;
    end
end
      
%% coregister DTI to T1
if get(handles.ckbDTI2T1,'value')
    fprintf('coregister diffusion data to T1 space...\n');
    for i = 1 : length(subj)
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1B.nii'];
        SouData = [DataDir,filesep,'DTIImg',filesep,subj{i},filesep,'dataB.nii'];
        OtherData = [DataDir,filesep,'DTIImg',filesep,subj{i},filesep,'dataB.nii'];
        TMScoregister(RefData,SouData,OtherData);
    end
end

if get(handles.rdbDiffQC,'value')
   %% for quality control
    mkdir([DataDir,filesep,'QC4DiffCoreg']);
   for i = 1 : length(subj)
      RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii']  ;
      SouData = [DataDir,filesep,inifd,filesep,subj{i},filesep,'dataB.nii']     ;
   imgs = {RefData [SouData ',1']};
   TMSSloverSPM(imgs,[DataDir,filesep,'QC4DiffCoreg',filesep,subj{i}]) ;
   end
    
end

if get(handles.ckbEddy,'value')
    fprintf('Eddy correction for diffusion data...\n');
    parfor i = 1 : length(subj)
        cmd = cat(2, 'sh ', [BETPath,filesep], 'TMSEddyCorr.sh');
        cd([DataDir,filesep,'DTIImg',filesep,subj{i}]) ;
        system(cmd)
    end
end

if get(handles.ckbDTIFiting,'value')
    fprintf('Tensor model fitting for diffusion data...\n');
    parfor i = 1 : length(subj)
        cmd = cat(2, 'sh ', [BETPath,filesep], 'TMSDTIFIT.sh');
        cd([DataDir,filesep,'DTIImg',filesep,subj{i}]) ;
        system(cmd)
    end
end

if get(handles.ckbDTIAFQ,'value')
    fprintf('AFQ processing...\n');
    
    parfor i = 1 : length(subj)
        DTIdir = [DataDir,filesep,'DTIImg',filesep,subj{i}]  ;
        T1dir  = [DataDir,filesep,'T1Img',filesep,subj{i}]  ;
        AFQTractValue(DTIdir,T1dir) ;
    end
    
    cd([DataDir,filesep,'DTIImg']) ;
    
    for i = 1 : length(subj)
        load([subj{i},filesep,'TractRes/FA.mat']) ;
        trackfa(:,:,i)= FA;
        load([subj{i},filesep,'TractRes/MD.mat']) ;
        trackmd(:,:,i)= MD;
    end

    save('trackfa.mat','trackfa') ; 
    save('trackmd.mat','trackmd') ; 

  
end

% if get(handles.rdbDTIQC,'value')
%     for i = 1 : length(subj)
%         DTIdir = [DataDir,filesep,'DTIImg',filesep,subj{i}]  
%         T1dir  = [DataDir,filesep,'T1Img',filesep,subj{i}]  
%         TrackQC(DTIdir,T1dir) ;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Analysis for FUNCTIONAL data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
%% FunRaw to FunImg
if get(handles.ckbFunDCM2NII,'value')
    parfor i = 1 : length(subj)
          mkdir([DataDir,filesep,'FunImg',filesep,subj{i}]) ;
          TMSDicomConvert([DataDir,filesep,inifd,filesep,subj{i}],...
                          [DataDir,filesep,'FunImg',filesep,subj{i}]) ;      
    end
    inifd = 'FunImg' ;
end

%% Delete N time points
if get(handles.ckbDelNTP,'value')
    IniTP = str2num(get(handles.editIniTP,'string')) ;
    EndTP = str2num(get(handles.editEndTP,'string')) ;
   parfor i = 1 : length(subj) 
     TempImage = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii*']) ;
     [pathstr, name, ext] = fileparts([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name]) ;
     if strcmp(ext,'.nii')
     [head,data] = TMSReadNii([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name]) ;
     elseif strcmp(ext,'.gz')
         TempImage(1).name
     gunzip([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name]) ;
     [head,data] = TMSReadNii([DataDir,filesep,inifd,filesep,subj{i},filesep,TempImage(1).name(1:end-3)]) ;
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
if get(handles.ckbDspk,'value')
    parfor i = 1 : length(subj) 
       mkdir ([DataDir,filesep,[inifd 'D'],filesep,subj{i}])  ;
       
       cmd = cat(2, 'sh ', [BETPath,filesep], 'WMDespike.sh');
       cd([DataDir,filesep,[inifd 'D'],filesep,subj{i}]) ;
       copyfile([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],...
           'fundata.nii')  ;
       system(cmd)
    end
    inifd = [inifd 'D']
end

%% Slice timing
if get(handles.ckbSliceTiming,'value')
    TR = str2num(get( handles.editTRs,'string'))
    Order = str2num(get( handles.editOrder,'string'))
    Ref = str2num(get( handles.editRefVol,'string'))
    
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
if get(handles.ckbRealign,'value')
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
    if exist([DataDir,filesep,inifd,filesep,subj{i},filesep,'rfundata.mat'],'file')
        delete([DataDir,filesep,inifd,filesep,subj{i},filesep,'rfundata.mat']);
    end
   end
   
   for i =1 : length(subj)
       % save head motion figure
       RP=load([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundata.txt'])  ;
       degreeRP = RP;
       degreeRP(:,4:6) = RP(:,4:6)*180/pi;
       figure(i);
       plot(degreeRP);
       I=getframe(gcf);
       imwrite (I.cdata,[DataDir,filesep,'HMparameter',filesep,subj{i},...
                filesep,'HeadMotion.bmp']);
       close(figure(i)) ;
    
       [HeadMotion(i,:) FD_Jenkinson FD_VanDijk FD_Power]=HMCalc(...
         [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundata.txt'],...
         [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'meanfundata.nii'])   ;  
     
     save([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'FD_Jenkinson.txt'],...
         'FD_Jenkinson', '-ASCII', '-DOUBLE','-TABS');
     save([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'FD_VanDijk.txt'], ...
         'FD_VanDijk', '-ASCII', '-DOUBLE','-TABS');
     save([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'FD_Power.txt'], ...
         'FD_Power', '-ASCII', '-DOUBLE','-TABS');
     save([DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundataDeg.txt'], ...
         'degreeRP', '-ASCII', '-DOUBLE','-TABS');
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
if get(handles.ckbFun2T1,'value')
    fprintf('coregister functional data to T1 space...\n');
    parfor i = 1 : length(subj)
      if strcmp(subj{i}(end-4:end-1),'_Run')
        mkdir([DataDir,filesep,[inifd 'T'],filesep,subj{i}]) ;
        if exist([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],'file')
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'ac_coT1B.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        else
        imglist = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii']);  
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,imglist(1).name],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1B.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        end
      else
        mkdir([DataDir,filesep,[inifd 'T'],filesep,subj{i}]) ;
        if exist([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],'file')
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1B.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        else
        imglist = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii']);  
        copyfile ([DataDir,filesep,inifd,filesep,subj{i},filesep,imglist(1).name],...
                  [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii'])  ;
        RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1B.nii']  ;
        SouData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']     ;
        OtherData = [DataDir,filesep,[inifd 'T'],filesep,subj{i},filesep,'fundata.nii']   ;
        TMScoregister(RefData,SouData,OtherData);
        end
      end
    end
   inifd = [inifd 'T'] ;
end

if get(handles.rdbFunQC,'value')
  %% for quality control
  mkdir([DataDir,filesep,'QC4FunCoreg'])
   for i = 1 : length(subj)
      if strcmp(subj{i}(end-4:end-1),'_Run')
        gunzip([DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'ac_coT1.nii.gz']) ;
          RefData = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'ac_coT1.nii']  ;
%       delete([DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'ac_coT1.nii']) ;
      else
           gunzip([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii.gz']) ;
           RefData = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii']  ;
%            delete([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'ac_coT1.nii']) ;
      end
      SouData = [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']     ;
   imgs = {RefData [SouData ',1']};
   TMSSloverSPM(imgs,[DataDir,filesep,'QC4FunCoreg',filesep,subj{i}]) ;
   end
   
end

%% remove covariates
%  get the covarites
if get(handles.ckbCovReg,'value')
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
      if get(handles.rdbHMFriston24,'value')
         HM6   = load(...
             [DataDir,filesep,'HMparameter',filesep,subj{i},filesep,'rp_fundata.txt']) ;
         HM24 = [HM6, [zeros(1,size(HM6,2));HM6(1:end-1,:)], HM6.^2, [zeros(1,size(HM6,2));HM6(1:end-1,:)].^2];
%          Covs= [Covs HM24];
      else
         HM24=[];
      end
 
      if get(handles.rdbWM,'value')
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

      if get(handles.rdbCSF,'value')
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

      if get(handles.rdbGS,'value')
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

%%  segment WM from the whole brain funcitonal images
if get(handles.ckbFunSeg,'value')
    

    WMSegThr= str2num( get(handles.editIndiWThr,'String')) ;
    if WMSegThr
    parfor i = 1 :  length(subj)
        [v fundata] = TMSReadNii(...
                      [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']);
         dim1 = v(1,1).dim(1) ; dim2 = v(1,1).dim(2) ; dim3 = v(1,1).dim(3) ;
     if strcmp(subj{i}(end-4:end-1),'_Run') 
        if ~exist ([DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'WMmask.nii'],'file')
           mkdir([DataDir,filesep,'IndiMasks']) ;
           if ~exist ([DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'fundata1tp.nii'],'file')
           TMSWriteNii (reshape(fundata(:,1),dim1,dim2,dim3),v,...
                     [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']) ;
            
           end
           wmmask = mkWMmask(...
               [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii'], ...
               [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'c2ac_coT1.nii'],...
               WMSegThr, 1) ;
        else
          [wmv wmmask] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'WMmask.nii']) ;
        end
     else
       if ~exist ([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'WMmask.nii'],'file')
           mkdir([DataDir,filesep,'IndiMasks']) ;
          if ~exist ([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'fundata1tp.nii'],'file')
           TMSWriteNii (reshape(fundata(:,1),dim1,dim2,dim3),v,...
                     [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']) ;
          end
          wmmask = mkWMmask(...
               [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii'], ...
               [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'c2ac_coT1.nii'],...
               WMSegThr, 1) ;
        else
          [wmv wmmask] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'WMmask.nii']) ;
        end  
     end
        wmfundata = fundata.*repmat(wmmask,[1,size(fundata,2)]) ;
        mkdir([DataDir,filesep,[inifd 'wm'],filesep,subj{i}])  ;
        TMSWriteNii(reshape(wmfundata,dim1,dim2,dim3,size(fundata,2)),v,...
           [DataDir,filesep,[inifd 'wm'],filesep,subj{i},filesep,'fundata.nii']);

    end
    end


    GMSegThr= str2num( get(handles.editIndiGThr,'String')) ;    % probability threshold from segmentation
    if GMSegThr
                 
    parfor i = 1 :  length(subj)
        [v fundata] = TMSReadNii(...
                         [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']);
        dim1 = v(1,1).dim(1) ; dim2 = v(1,1).dim(2) ; dim3 = v(1,1).dim(3) ;
        
      if strcmp(subj{i}(end-4:end-1),'_Run')
        if ~exist ([DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'GMmask.nii'],'file')
           mkdir([DataDir,filesep,'IndiMasks']) ;
           TMSWriteNii (reshape(fundata(:,1),dim1,dim2,dim3),v,...
                     [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']) ;

            gmmask = mkGMmask(...
               [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii'], ...
               [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'c1ac_coT1.nii'],...
               GMSegThr, 1) ;
        else
           [gmv gmmask] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'GMmask.nii']) ;
        end
      else
        if ~exist ([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'GMmask.nii'],'file')
           mkdir([DataDir,filesep,'IndiMasks']) ;
           TMSWriteNii (reshape(fundata(:,1),dim1,dim2,dim3),v,...
                     [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii']) ;

            gmmask = mkGMmask(...
               [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'fundata1tp.nii'], ...
               [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'c1ac_coT1.nii'],...
               GMSegThr, 1) ;
        else
           [gmv gmmask] =TMSReadNii([DataDir,filesep,'T1Img',filesep,subj{i},filesep,'GMmask.nii']) ;
        end 
      end
        gmfundata = fundata.*repmat(gmmask,[1,size(fundata,2)]) ;
        mkdir([DataDir,filesep,[inifd 'gm'],filesep,subj{i}])  ;
        TMSWriteNii(reshape(gmfundata,dim1,dim2,dim3,size(fundata,2)),v,...
           [DataDir,filesep,[inifd 'gm'],filesep,subj{i},filesep,'fundata.nii']);
    end
    end
inifd = [inifd 'wm'] ;
fprintf('\n\t Segmentation for Functional Images compeleted.\n'); 
end

%% Smooth functioanl data
if get (handles.ckbFunSmooth,'value')
    parfor i = 1 :  length(subj)
        mkdir([DataDir,filesep,[inifd 'S'],filesep,subj{i}]) ;
        TMSsmooth([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],4) ;
        movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,'sfundata.nii'],...
            [DataDir,filesep,[inifd 'S'],filesep,subj{i},filesep,'fundata.nii']) ;
    end
    inifd = [inifd 'S']
fprintf('\n\t Spatial smooth compeleted.\n'); 
end

%% Filter
if get (handles.ckbFunFilter,'value')
    lowcut = str2num(get(handles.editLowCut,'string')) ;
    highcut = str2num(get(handles.editHighCut,'string')) ;
    TR = str2num(get(handles.editTRs,'string'))  ;
    [v Vol4d] = TMSReadNii([DataDir,filesep,inifd,filesep,subj{1},filesep,'fundata.nii']);
    dim1 = v(1,1).dim(1) ; dim2 = v(1,1).dim(2) ; dim3 = v(1,1).dim(3) ;
    
    parfor i = 1 :  length(subj)
        mkdir([DataDir,filesep,[inifd 'F'],filesep,subj{i}]) ;
        [headf,fundata] = TMSReadNii ([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii']) ;
%         
         [v maskdata]  = TMSReadNii ([DataDir,filesep,'IndiMasks',...
                                      filesep,subj{i},filesep,'rwBrainMask.nii']) ;
         maskdata(find( maskdata)) = 1 ;
        
        AllVolume = TMSfilter(fundata,reshape(maskdata,dim1*dim2*dim3,1),TR,lowcut, highcut) ;
        TMSWriteNii(reshape(AllVolume,headf(1,1).dim(1),headf(1,1).dim(2),...
             headf(1,1).dim(3),size(fundata,2)),headf,...
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
            
              %% These were added for aligning the head information of
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
                
                %% These were added for aligning the head information of
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
             i = i + length(RunList)
       else
           
           mkdir([[inifd 'M'],filesep,subj{i}]);
           copyfile([inifd,filesep,subj{i},filesep,'fundata.nii'],...
               [[inifd 'M'],filesep,subj{i},filesep,'fundata.nii']) ;
           i=i+1;
       end
     end
    
    inifd = [inifd 'M'] ;; 
end


%% computing alff
if get(handles.rbdFunALFF,'value')
    mkdir([DataDir,filesep,['ALFF_',inifd]]);
    lowcut = str2num(get(handles.editLowCut,'string')) ;
    highcut = str2num(get(handles.editHighCut,'string')) ;
    TR = str2num(get(handles.editTRs,'string'))  ;
    
    SpaMask = get(handles.ppmMask,'value')  
   
   parfor i =1 : length(subj)
        mkdir([DataDir,filesep,['ALFF_',inifd],filesep,subj{i}]) ;
        InNiiDir =  [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'] ; 
        [head InData] = TMSReadNii(InNiiDir) ;
        InData1 = InData(:,1) ;
        OutNiiName = [DataDir,filesep,['ALFF_',inifd],...
                     filesep,subj{i},filesep,['ALFF_' subj{i} '.nii']] ;

        if SpaMask == 2
            MaskNiiName = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'WMmask.nii']
        elseif SpaMask == 3
            MaskNiiName = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'GMmask.nii']
        elseif SpaMask == 4
            if exist([DataDir,filesep,'IndiMasks',filesep,[subj{i} '_Run1']],'dir')
               MaskNiiName = [DataDir,filesep,'IndiMasks',filesep,[subj{i} '_Run1'],filesep,'rwBrainMask.nii'] ;
            else
               MaskNiiName = [DataDir,filesep,'IndiMasks',filesep,subj{i},filesep,'rwBrainMask.nii'] ;
            end
        end         
        TMSfalff(InNiiDir, TR, highcut, lowcut, MaskNiiName, OutNiiName) ;
    end
    inifd = ['ALFF_',inifd] ;
end


%% Transfer functional image to MNI space
if get (handles.ckbFun2MNI,'value')
   SpaNorVal = get(handles.ppmFunSpaNor,'Value') ; 
   parfor i = 1 :  length(subj)
     if SpaNorVal == 1
       fprintf('\n\t Translating images into MNI space...\n');
       if strcmp(subj{i}(end-4:end-1),'_Run')
        MATdir = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'y_ac_coT1B.nii']
       else
        MATdir = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'y_ac_coT1B.nii'] 
       end
        mkdir([DataDir,filesep,[inifd 'W'],filesep,subj{i}]) ;
        if exist([DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'],'file')
           ImgDir= [DataDir,filesep,inifd,filesep,subj{i},filesep,'fundata.nii'];
           TMSwriteDTL(MATdir,ImgDir) ;
           movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,'wfundata.nii'],...
               [DataDir,filesep,[inifd 'W'],filesep,subj{i},filesep,'fundata.nii'])  ;
        else
           imglist = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii'])  
           for imgnb = 1 : length(imglist)
              ImgDir= [DataDir,filesep,inifd,filesep,subj{i},filesep,imglist(imgnb).name];
              TMSwriteDTL(MATdir,ImgDir) ;
              movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,['w' imglist(imgnb).name]],...
                 [DataDir,filesep,[inifd 'W'],filesep,subj{i},filesep,['w' imglist(imgnb).name]]);
           end
        end
     elseif SpaNorVal == 2
        fprintf('\n\t Translating images into individual T1 space...\n');
         if strcmp(subj{i}(end-4:end-1),'_Run')
           MATdir = [DataDir,filesep,'T1Img',filesep,subj{i}(1:end-5),filesep,'iy_ac_coT1B.nii'] ;
         else
           MATdir = [DataDir,filesep,'T1Img',filesep,subj{i},filesep,'iy_ac_coT1B.nii'] ;  
         end
           mkdir([DataDir,filesep,[inifd 'W'],filesep,subj{i}]) ;
           imglist = dir([DataDir,filesep,inifd,filesep,subj{i},filesep,'*.nii'])  ;
           for imgnb = 1 : length(imglist)
              ImgDir= [DataDir,filesep,inifd,filesep,subj{i},filesep,imglist(imgnb).name];
              TMSwriteDTL(MATdir,ImgDir) ;
              movefile([DataDir,filesep,inifd,filesep,subj{i},filesep,['w' imglist(imgnb).name]],...
                 [DataDir,filesep,[inifd 'W'],filesep,subj{i},filesep,['w' imglist(imgnb).name]]);
           end
     end
        
   end
   inifd=[inifd 'W'] ;

end

%% computing alff in 20 AFQ tracks
if get(handles.rbdFunAFQ,'value') 
    WMms = get(handles.editVar,'string') ;
    fprintf('\n\t Computing ALFF in 20 AFQ Tracts...\n'); 
    parfor i =1 : length(subj)
        DTIdir = [DataDir,filesep,'DTIImg',filesep,subj{i}]  ;
        T1dir  = [DataDir,filesep,'T1Img',filesep,subj{i}]  ;
        ALFFdir = [DataDir,filesep,inifd,filesep,subj{i}]  ;
        AFQTractValue(DTIdir,T1dir,ALFFdir,WMms) ;
    end
%% QC    
%     for i = 1 : length(subj)
%         DTIdir = [DataDir,filesep,'DTIImg',filesep,subj{i}]  
%         T1dir  = [DataDir,filesep,'T1Img',filesep,subj{i}]  
%         FunDir = [DataDir,filesep,inifd,filesep,subj{i}]  
%         TrackQC(DTIdir,T1dir,FunDir,WMms) ;
%     end

    cd([DataDir,filesep,'DTIImg']) ;
    for i = 1 : length(subj)
        load([subj{i},filesep,'TractRes',filesep,[WMms '.mat']]) ;
        trackflex(:,:,i)= FlexM;
    end

    save('trackflex.mat','trackflex') ; 
end


       

% --- Executes on button press in rdbGroupThr.
function rdbGroupThr_Callback(hObject, eventdata, handles)
function phbInifd_Callback(hObject, eventdata, handles)
function rbdFunALFF_Callback(hObject, eventdata, handles)
function rbdFunAFQ_Callback(hObject, eventdata, handles)
function ckbGmask_Callback(hObject, eventdata, handles)



function editVar_Callback(hObject, eventdata, handles)


function editVar_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function rdbDTIQC_Callback(hObject, eventdata, handles)
function ppmFunSpaNor_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEndTP_Callback(hObject, eventdata, handles)
function editEndTP_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function checkbox35_Callback(hObject, eventdata, handles)
function pushbutton6_Callback(hObject, eventdata, handles)
function slider2_Callback(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ckbDspk_Callback(hObject, eventdata, handles)
function text9_CreateFcn(hObject, eventdata, handles)
function ckbFunAll_Callback(hObject, eventdata, handles)
% if ~get(handles.ckbFunAll,'value')     
%     set(handles.ckbFunDCM2NII,'Enable','off') ;  
%     set(handles.ckbDelNTP,'Enable','off') ;
%     set(handles.editIniTP,'Enable','off') ;
%     set(handles.editEndTP,'Enable','off') ;
%     set(handles.ckbDspk,'Enable','off') ;
%     set(handles.ckbSliceTiming,'Enable','off') ;
%     set(handles.ckbRealign,'Enable','off') ;
%     set(handles.ckbFun2T1,'Enable','off') ;
%     set(handles.ckbCovReg,'Enable','off') ;
%     set(handles.ckbFunSeg,'Enable','off') ;
%     set(handles.ckbFunSmooth,'Enable','off') ;
%     set(handles.ckbFunFilter,'Enable','off') ;
%     set(handles.rbdFunALFF,'Enable','off') ;
%     set(handles.rbdFunAFQ,'Enable','off') ;
%     set(handles.ckbFun2MNI,'Enable','off') ;
%     set(handles.ppmFunSpaNor,'Enable','off') ;
%     set(handles.editTRs,'Enable','off') ;
%     set(handles.editRefVol,'Enable','off') ;
%     set(handles.editOrder,'Enable','off') ;
%     set(handles.edit7,'Enable','off') ;
%     set(handles.editLowCut,'Enable','off') ;
%     set(handles.editHighCut,'Enable','off') ;
%     set(handles.editVar,'Enable','off') ;
% 
%     
% else
%     set(handles.ckbFunDCM2NII,'Enable','on') ;  
%     set(handles.ckbDelNTP,'Enable','on') ;
%     set(handles.editIniTP,'Enable','on') ;
%     set(handles.editEndTP,'Enable','on') ;
%     set(handles.ckbDspk,'Enable','on') ;
%     set(handles.ckbSliceTiming,'Enable','on') ;
%     set(handles.ckbRealign,'Enable','on') ;
%     set(handles.ckbFun2T1,'Enable','on') ;
%     set(handles.ckbCovReg,'Enable','on') ;
%     set(handles.ckbFunSeg,'Enable','on') ;
%     set(handles.ckbFunSmooth,'Enable','on') ;
%     set(handles.ckbFunFilter,'Enable','on') ;
%     set(handles.rbdFunALFF,'Enable','on') ;
%     set(handles.rbdFunAFQ,'Enable','on') ;
%     set(handles.ckbFun2MNI,'Enable','on') ;
%     set(handles.ppmFunSpaNor,'Enable','on') ;
%     set(handles.editTRs,'Enable','on') ;
%     set(handles.editRefVol,'Enable','on') ;
%     set(handles.editOrder,'Enable','on') ;
%     set(handles.edit7,'Enable','on') ;
%     set(handles.editLowCut,'Enable','on') ;
%     set(handles.editHighCut,'Enable','on') ;
%     set(handles.editVar,'Enable','on') ;
% end   


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ppmMask.
function ppmMask_Callback(hObject, eventdata, handles)
SpaMask = get(handles.ppmMask,'Value') 
switch SpaMask
    case 2
       fprintf('\n\t computing measure in white matter...\n');
    case 3
       fprintf('\n\t computing measure in gray matter...\n');
    case 4
       fprintf('\n\t computing measure in whole brain...\n');
%     case 5
%        fprintf('\n\t computing measure in a MNI mask...\n');
%        [maskname maskdir] = uigetfile('.nii','Select a nii file in MNI space') ;
end

% --- Executes during object creation, after setting all properties.
function ppmMask_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function rdbDTIQC_CreateFcn(hObject, eventdata, handles)
function radiobutton18_Callback(hObject, eventdata, handles)
function radiobutton18_CreateFcn(hObject, eventdata, handles)
function rdbFunQC_Callback(hObject, eventdata, handles)
function rdbT1QC_Callback(hObject, eventdata, handles)
function rdbDiffQC_Callback(hObject, eventdata, handles)


% --- Executes on button press in ckbM.
function ckbM_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function ckbM_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function text38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ckbDTITopup.
function ckbDTITopup_Callback(hObject, eventdata, handles)
% hObject    handle to ckbDTITopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckbDTITopup
