function varargout = AFQstat(varargin)
% AFQSTAT M-file for AFQstat.fig

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AFQstat_OpeningFcn, ...
                   'gui_OutputFcn',  @AFQstat_OutputFcn, ...
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
function AFQstat_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = AFQstat_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editDataDir_Callback(hObject, eventdata, handles)
function editDataDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function editSampleSize_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function phbDataDir_Callback(hObject, eventdata, handles)
DTIdir = uigetdir ;
set(handles.editDataDir,'string',DTIdir)
function editSampleSize_Callback(hObject, eventdata, handles)

function pshbRunStat_Callback(hObject, eventdata, handles)
SampSize = str2num(get(handles.editSampleSize,'string'));
ng1 = SampSize(1); ng2 = SampSize(2);
DTIdir = get(handles.editDataDir,'string')
subj = importdata(get(handles.editSubjDir,'string'));
WMms = get(handles.editWMmeasure,'string') ;
[wmpath a b] = fileparts(which('WhiteMatter'));

cd([DTIdir]) ;
    for i = 1 : length(subj)
        FlexM = importdata([subj{i},filesep,'TractRes',filesep,[WMms '.mat']]) ;
        trackflex(:,:,i)= FlexM;
    end

fbms = trackflex(:,:,2:2:80)-trackflex(:,:,1:2:80);
% fbms(:,19:20,:)=[];  % excluding the 19th, 20th bundles
[inda indb] = find(isnan(mean(squeeze(mean(fbms)))));

if size(indb,2)
fprintf('\nSome bundles were not successfully tracked in these subjects...\n'); 
for n = 1  : size(indb,2)
        disp(subj{indb(n)}) ;
end
fprintf('They will be excluded from following analysis\n'); 
end

fbms(:,:,indb)=[];
if size(find(indb<=ng1),2)
   ng1 = ng1-size(find(indb<=SampSize(1)),2) 
end
if size(find(indb>ng1),2)
   ng2 = ng2-size(find(indb>SampSize(1)),2) 
end

bundlename= {'Left Thalmic Radiation','Right Thalmic Radiation'...
    'Left Corticospinal','Right Corticospinal', ...
    'Left Cingulum Cingulate','Right Cingulum Cingulate', ...
    'Left Cingulum Hippocampus',  'Right Cingulum Hippocampus',...
    'Callosum Forceps Major','Callosum Forceps Minor',...
    'Left IFOF','Right IFOF',...
    'Left ILF','Right ILF',...
    'Left SLF','Right SLF',...
    'Left Uncinate','Right Uncinate'...
    'Left Arcuate','Right Arcuate'}; 

for bn = 1 : 20
  AFQplot(ng1,ng2,fbms(:,bn,:),bundlename(bn));
  export_fig ([DTIdir,filesep,[WMms '_' bundlename{bn}  '.png']]) ;
  close
end
save([DTIdir,filesep,'fbms'],'fbms')

mkdir([DTIdir,filesep,'TrackNii']);
for i = 1 : size(fbms,3)
    data=zeros(10000,100) ;
    data(101:4:172,:) = fbms(:,:,i)' ;
    save('data','data','-ascii')
    cmd = cat(2, 'sh ', [wmpath,filesep], 'txt2nii.sh');
    system(cmd) ;
    newname = ['000' num2str(i)]
    movefile([DTIdir,filesep,'tempimg.nii.gz'],...
        ['TrackNii',filesep, ['Subj' newname(end-2:end)  '.nii.gz']]) ;
end
save ('fbms.mat','fbms')
copyfile([wmpath,filesep,'Track18Mask.nii.gz'],...
    [DTIdir,filesep,'TrackNii',filesep,'mask.nii.gz']) ;
cmd = cat(2, 'sh ', [wmpath,filesep],...
      ['TwoSamTTest.sh ' num2str(ng1) ' ' num2str(ng2)...
      ' ' [DTIdir,filesep,'TrackNii']]);
system(cmd) ;





function editSubjDir_Callback(hObject, eventdata, handles)
function editSubjDir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function phbSubjDir_Callback(hObject, eventdata, handles)
[txtname txtdir] = uigetfile ;
set(handles.editSubjDir,'string',[txtdir,txtname])



function editWMmeasure_Callback(hObject, eventdata, handles)



function editWMmeasure_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
