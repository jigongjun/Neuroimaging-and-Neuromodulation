function varargout = TMSfunseg(varargin)
% TMSFUNSEG M-file for TMSfunseg.fig
%      TMSFUNSEG, by itself, creates a new TMSFUNSEG or raises the existing
%      singleton*.
%
%      H = TMSFUNSEG returns the handle to a new TMSFUNSEG or the handle to
%      the existing singleton*.
%
%      TMSFUNSEG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TMSFUNSEG.M with the given input arguments.
%
%      TMSFUNSEG('Property','Value',...) creates a new TMSFUNSEG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TMSfunseg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TMSfunseg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TMSfunseg

% Last Modified by GUIDE v2.5 17-Apr-2020 15:27:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TMSfunseg_OpeningFcn, ...
                   'gui_OutputFcn',  @TMSfunseg_OutputFcn, ...
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


% --- Executes just before TMSfunseg is made visible.
function TMSfunseg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TMSfunseg (see VARARGIN)

% Choose default command line output for TMSfunseg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TMSfunseg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TMSfunseg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function EditAnalyDir_Callback(hObject, eventdata, handles)
% hObject    handle to EditAnalyDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditAnalyDir as text
%        str2double(get(hObject,'String')) returns contents of EditAnalyDir as a double


% --- Executes during object creation, after setting all properties.
function EditAnalyDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditAnalyDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chkHOAconvert.
function chkHOAconvert_Callback(hObject, eventdata, handles)
% hObject    handle to chkHOAconvert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkHOAconvert


% --- Executes on button press in chkWMseg.
function chkWMseg_Callback(hObject, eventdata, handles)
% hObject    handle to chkWMseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkWMseg


% --- Executes on button press in chkGMseg.
function chkGMseg_Callback(hObject, eventdata, handles)
% hObject    handle to chkGMseg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkGMseg



function edtWMthr_Callback(hObject, eventdata, handles)
% hObject    handle to edtWMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtWMthr as text
%        str2double(get(hObject,'String')) returns contents of edtWMthr as a double


% --- Executes during object creation, after setting all properties.
function edtWMthr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtWMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtGMthr_Callback(hObject, eventdata, handles)
% hObject    handle to edtGMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtGMthr as text
%        str2double(get(hObject,'String')) returns contents of edtGMthr as a double


% --- Executes during object creation, after setting all properties.
function edtGMthr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtGMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chkProduceGroupMask.
function chkProduceGroupMask_Callback(hObject, eventdata, handles)
% hObject    handle to chkProduceGroupMask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkProduceGroupMask



function edtGroupWMthr_Callback(hObject, eventdata, handles)
% hObject    handle to edtGroupWMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtGroupWMthr as text
%        str2double(get(hObject,'String')) returns contents of edtGroupWMthr as a double


% --- Executes during object creation, after setting all properties.
function edtGroupWMthr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtGroupWMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtGroupGMthr_Callback(hObject, eventdata, handles)
% hObject    handle to edtGroupGMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtGroupGMthr as text
%        str2double(get(hObject,'String')) returns contents of edtGroupGMthr as a double


% --- Executes during object creation, after setting all properties.
function edtGroupGMthr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtGroupGMthr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditFunDir_Callback(hObject, eventdata, handles)
% hObject    handle to EditFunDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditFunDir as text
%        str2double(get(hObject,'String')) returns contents of EditFunDir as a double


% --- Executes during object creation, after setting all properties.
function EditFunDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditFunDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditT1Dir_Callback(hObject, eventdata, handles)
% hObject    handle to EditT1Dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditT1Dir as text
%        str2double(get(hObject,'String')) returns contents of EditT1Dir as a double


% --- Executes during object creation, after setting all properties.
function EditT1Dir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditT1Dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	AnalyDir = spm_select(1,'dir','please the analytic directory')
    if ischar(AnalyDir),
		set(handles.EditAnalyDir,'String',AnalyDir)
    end
    
 

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


AnalyDir = get(handles.EditAnalyDir,'String') ;
T1folder = get(handles.EditT1Dir,'String') ;
[TMSPath, fileN, extn] = fileparts(which('TMStarget.m')) ;
t1path = [AnalyDir,filesep,T1folder]   ;

%% convert HOA atlas into individual T1 sapce
if get(handles.chkHOAconvert,'value')
hoamask = [TMSPath '/mask/HOAsub25prob.nii'] ;
sublist = dir (t1path)  ;

for i = 3 : length(sublist)
%     cd ([t1path,filesep,sublist(i).name])
    matlist = dir ([t1path,filesep,sublist(i).name,filesep,'iy*.nii']) ;
    matnii = [t1path,filesep,sublist(i).name,filesep,matlist(1).name]
matlabbatch{1}.spm.spatial.normalise.write.subj.def = {matnii} ;
%{'/ewSegment/HC_caizhi/iy_coSYT1016vascular.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = {[hoamask ',1']};
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-90 -126 -72
                                                          90 90 108];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [3 3 3];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 0;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

spm_jobman('run',matlabbatch)

copyfile([TMSPath '/mask/wHOAsub25prob.nii'],...
[t1path,filesep,sublist(i).name,filesep,'wHOAsub25prob.nii'])  ;
end
end

%%  segment WM from the whole brain funcitonal images
GMSegThr= str2num( get(handles.edtWMthr,'String')) ;    % probability threshold from segmentation
WMSegThr= str2num( get(handles.edtGMthr,'String')) ;  

if get(handles.chkWMseg,'value') || get(handles.chkGMseg,'value') || get(handles.chkProduceGroupMask,'value')
path1 = [AnalyDir,filesep,T1folder]  ;
assesedfoldname =  get(handles.EditFunDir,'String')      ;
path2 =  [AnalyDir,filesep,assesedfoldname ]  ;
list1 = dir(path2)   ;
fprintf('Computing functional white matter iamges...\n');

for i = 3 :  length(list1)
    imglist1 = dir ([path1,filesep,list1(i).name,filesep,'c2*.nii']) ;
    imglist2 = dir ([path2,filesep,list1(i).name,filesep,'*.nii']) ;
    [fun funvoxel funhead] = rest_readfile([path2,filesep,list1(i).name,...
        filesep,imglist2(1).name]) ;  
    [n1 n2 n3 n4] = size(fun)  ;
    
    if ~exist ([path1,filesep,list1(i).name,filesep,'WMmask.nii'])
%         rest_ResliceImage([path1,filesep,list1(i).name,filesep,imglist1(1).name],...
%         [path1,filesep,list1(i).name,filesep,'rspl_' imglist1(1).name],...
%         [n1 n2 n3],0,[path2,filesep,list1(i).name,filesep,imglist2(1).name])  ;
%        
%         imglist3 = dir ([path1,filesep,list1(i).name,filesep,'rspl_c2*.nii']) ;
%         [c2 c2voxel c2head] = rest_readfile([path1,filesep,list1(i).name,filesep,imglist3(1).name]) ;
%         c2(find(c2<WMSegThr))=0; c2(find(c2))=1;  % 0.9 propobility threshold
%     
%         rest_ResliceImage([path1,filesep,list1(i).name,filesep,'wHOAsub25prob.nii'],...
%                           [path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii'],...
%                           [n1 n2 n3],0,[path2,filesep,list1(i).name,filesep,imglist2(1).name])  ;
%         [submask subvoxel subhead] = rest_readfile(...
%                           [path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii']) ;
%         submask(find(submask==0))=1000 ;  
%         submask(find(submask<10))=0 ; 
%         submask(find(submask))=1 ;
%         c2mask = c2.*submask ;
        
        wmmask = mkWMmask([path2,filesep,list1(i).name,filesep,imglist2(1).name], ...
                          [path1,filesep,list1(i).name], WMSegThr, 1) ;
        c2mask = reshape (wmmask,n1,n2,n3) ;
    else
%         imglist3 = dir ([path1,filesep,list1(i).name,filesep,'rspl_c2*.nii']) ;
%         [c2 c2voxel c2head] = rest_readfile([path1,filesep,list1(i).name,filesep,imglist3(1).name]) ;
%         c2(find(c2<WMSegThr))=0; 
%         c2(find(c2))=1;  % 0.9 propobility threshold
%     
%         [submask subvoxel subhead] = rest_readfile([path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii']) ;
%         submask(find(submask==0))=1000 ;  submask(find(submask<10))=0 ; submask(find(submask))=1 ;
%     
%         c2mask = c2.*submask ;
        
        [v c2mask] =TMSReadNii([path1,filesep,'WMmask.nii']) ;
        c2mask = reshape (wmmask,n1,n2,n3) ;
    end
    mkdir([AnalyDir,filesep,assesedfoldname,'wm',filesep, list1(i).name])
    rest_Write4DNIfTI([repmat(c2mask,[1 1 1 n4]).*fun],funhead,...
       [AnalyDir,filesep,assesedfoldname,'wm',filesep,list1(i).name,filesep,list1(i).name '_WM.nii']);
end
fprintf('Functional white matter iamges has been saved.\n'); 
end

%%  segment GM from the whole brain funcitonal images
if get(handles.chkGMseg,'value')
    fprintf('Computing functional gray matter iamges...\n'); 
for i = 3 :  length(list1)
    imglist1 = dir ([path1,filesep,list1(i).name,filesep,'c1*.nii']) ;
    imglist2 = dir ([path2,filesep,list1(i).name,filesep,'*.nii']) ;
    [fun funvoxel funhead] = rest_readfile([path2,filesep,list1(i).name,filesep,imglist2(1).name]) ;  
    [n1 n2 n3 n4] = size(fun)  ;
    
     imgrsp = dir ([path1,filesep,list1(i).name,filesep,'rspl_*']);
    if size(imgrsp,1)<3
       rest_ResliceImage([path1,filesep,list1(i).name,filesep,imglist1(1).name],...
        [path1,filesep,list1(i).name,filesep,'rspl_' imglist1(1).name],...
        [n1 n2 n3],0,[path2,filesep,list1(i).name,filesep,imglist2(1).name])  ;
    
    
        imglist3 = dir ([path1,filesep,list1(i).name,filesep,'rspl_c1*.nii']) ;
        [c2 c2voxel c2head] = rest_readfile([path1,filesep,list1(i).name,...
        filesep,imglist3(1).name]) ;
        c2(find(c2<GMSegThr))=0; c2(find(c2))=1;  % 0.3 propobility threshold
        
        [submask subvoxel subhead] = rest_readfile([path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii']) ;
        submask(find(submask))=1 ; 
    
        c2mask = c2+submask ;
        c2mask(find(c2mask))=1;
    else
        imglist3 = dir ([path1,filesep,list1(i).name,filesep,'rspl_c1*.nii']) ;
        [c2 c2voxel c2head] = rest_readfile([path1,filesep,list1(i).name,...
        filesep,imglist3(1).name]) ;
        c2(find(c2<GMSegThr))=0; c2(find(c2))=1;  % 0.3 propobility threshold
        
        [submask subvoxel subhead] = rest_readfile([path1,filesep,list1(i).name,filesep,'rspl_wHOAsub25prob.nii']) ;
        submask(find(submask))=1 ; 
    
        c2mask = c2+submask ;
        c2mask(find(c2mask))=1;
    end
    mkdir([AnalyDir,filesep,assesedfoldname,'gm',filesep, list1(i).name]) ;
    rest_Write4DNIfTI([repmat(c2mask,[1 1 1 n4]).*fun],funhead,...
       [AnalyDir,filesep,assesedfoldname,'gm',filesep,list1(i).name,filesep,list1(i).name '_GM.nii']);
end
fprintf('Functional gray matter iamges has been saved.\n'); 
end

%% producing group level WM and GM mask for statstical analysis
if get(handles.chkProduceGroupMask,'value')
    fprintf('Computing group level mask...\n'); 
    
GMGroupThr= str2num(get(handles.edtGroupGMthr,'String')) ;  % probability threshold across subjects
WMGroupThr= str2num(get(handles.edtGroupWMthr,'String')) ;
hoamask = [TMSPath '/mask/excludHOAsub25prob145121145.nii'] ;
[hoadata hoavoxel hoahead] = rest_readfile(hoamask)  ;
p1 = [AnalyDir,filesep,T1folder]    ;
list = dir (p1)  ;

for i = 3 : length(list)
    img1 = dir([p1,filesep,list(i).name,filesep,'wc*.nii']) ;
    [data1 voxel1 head1] = rest_readfile ([p1,filesep,list(i).name,filesep,img1(1).name]) ;
    [data2 voxel2 head2] = rest_readfile ([p1,filesep,list(i).name,filesep,img1(2).name]) ;
  datac1(:,:,:,i-2) = data1  ;
  datac2(:,:,:,i-2) = data2  ;
end

datac1 (find(datac1>GMSegThr)) = 1  ;
datac2 (find(datac2>WMSegThr)) = 1  ;
datac1 (find(datac1<1)) = 0  ;
datac2 (find(datac2<1)) = 0  ;
datac11 = sum (datac1,4)./size(datac1,4) ;
datac22 = sum (datac2,4)./size(datac1,4) ;
head1.dt=[8 0] ;
datac22 = datac22 .* hoadata ;
mkdir ([AnalyDir,filesep,'GroupLevelMask']) ;
rest_WriteNiftiImage(datac11,head1,[AnalyDir,filesep,'GroupLevelMask',filesep,'GMProb.nii'])  ;
rest_WriteNiftiImage(datac22,head1,[AnalyDir,filesep,'GroupLevelMask',filesep,'WMProb.nii'])  ;

datac11 (find(datac11>GMGroupThr)) = 1 ;
datac22 (find(datac22>WMGroupThr)) = 1 ;
datac11 (find(datac11<1)) = 0 ;
datac22 (find(datac22<1)) = 0 ;
rest_WriteNiftiImage(datac11,head1,[AnalyDir,filesep,'GroupLevelMask',filesep,'GMProb' num2str(GMGroupThr*100) '.nii'])  ;
rest_WriteNiftiImage(datac22,head1,[AnalyDir,filesep,'GroupLevelMask',filesep,'WMProb' num2str(WMGroupThr*100) '.nii'])  ;
TMSreslice([TMSPath '/mask/HOAsub25prob.nii'],...
    [AnalyDir,filesep,'GroupLevelMask',filesep,['GMProb' num2str(GMGroupThr*100) '.nii']],...
    [AnalyDir,filesep,'GroupLevelMask',filesep,['GMProb' num2str(GMGroupThr*100) '333.nii']]) ;
TMSreslice([TMSPath '/mask/HOAsub25prob.nii'],...
    [AnalyDir,filesep,'GroupLevelMask',filesep,['WMProb' num2str(WMGroupThr*100) '.nii']],...
    [AnalyDir,filesep,'GroupLevelMask',filesep,['WMProb' num2str(GMGroupThr*100) '333.nii']]) ;
fprintf('Group-level mask has been saved in the folder: GroupLevelMask.\n'); 

end

if get(handles.ckbSmooth,'value')
    fprintf('Smoothing...\n'); 
 sublist4 = dir ([AnalyDir,filesep,'FunImgARCwm']) ;
 mkdir([AnalyDir,filesep,'FunImgARCwmS']) ;
 SKernal = str2num(get(handles.edit8,'String')) ;
 parfor i = 3 : length(sublist4)
     imglist4 = dir ([AnalyDir,filesep,'FunImgARCwm',filesep,sublist4(i).name,filesep,'*.nii']) ;
     TMSsmooth({[AnalyDir,filesep,'FunImgARCwm',filesep,sublist4(i).name,filesep,imglist4(1).name]}, ...
         [SKernal SKernal SKernal]) ;
     mkdir([AnalyDir,filesep,'FunImgARCwmS',filesep,sublist4(i).name]) ;
     movefile([AnalyDir,filesep,'FunImgARCwm',filesep,sublist4(i).name,filesep,['s' imglist4(1).name]],...
         [AnalyDir,filesep,'FunImgARCwmS',filesep,sublist4(i).name,filesep,['s' imglist4(1).name]])
 end
 
end


if get(handles.ckbalff,'value')
     fprintf('Computing ALFF in white matter...\n');
     TR = str2num(get(handles.editTR,'String')) ;
     fpath = [AnalyDir,filesep,'FunImgARCwmS'];
     tpath = [AnalyDir,filesep,'T1ImgNewSegment'] ;
     sublist5 = dir (fpath) ;
   parfor i =3 : length(sublist5)
       funlist5 = dir ([fpath,filesep,sublist5(i).name,filesep,'*.nii']) ;
       AllVolume = [fpath,filesep,sublist5(i).name,filesep,funlist5(1).name] ;
       if ~exist ([tpath,filesep,sublist5(i).name,filesep,'WMmask.nii'],'file')
           fprintf('Computing mask for white matter...\n');
           wmmask = mkWMmask(AllVolume,[tpath,filesep,sublist5(i).name], WMSegThr, 1);
           AMaskFilename = [tpath,filesep,sublist5(i).name,filesep,'WMmask.nii'] ;
       else
          
           AMaskFilename = [tpath,filesep,sublist5(i).name,filesep,'WMmask.nii'] ;
           [v wmmask] =TMSReadNii(AMaskFilename) ;
       end
       
       if ~exist ([AnalyDir,filesep,'Results',filesep,'ALFF',filesep,sublist5(i).name]);
          mkdir([AnalyDir,filesep,'Results',filesep,'ALFF',filesep,sublist5(i).name]) ;
       end
       
       AResultFilename = [AnalyDir,filesep,'Results',filesep,...
           'ALFF',filesep,sublist5(i).name,filesep,['ALFF_' sublist5(i).name '.nii']]
       [ALFFBrain, Header] = alff(AllVolume,TR, 0.1, 0.01, ...
           AMaskFilename, AResultFilename) ;
       
       data = reshape(ALFFBrain,Header.dim(1)*Header.dim(2)*Header.dim(3),1);
       data = wmmask.*data ;  zdata  = data ; mdata=data;
       zdata (find(data)) = (data(find(data)) - mean(data(find(data))))./std(data(find(data))) ;
      mdata (find(data)) = (data(find(data))./mean(data(find(data)))) ;
       [v data2] =TMSReadNii([AnalyDir,filesep,'Results',filesep,'ALFF',...
        filesep,sublist5(i).name,filesep,['ALFF_' sublist5(i).name '.nii']] ) ;
    
    TMSWriteNii(reshape(zdata , Header.dim(1),Header.dim(2),Header.dim(3)), v ,...
        [AnalyDir,filesep,'Results',filesep,'ALFF',...
        filesep,sublist5(i).name,filesep,['zALFF_' sublist5(i).name '.nii']]) ;
    TMSWriteNii(reshape(zdata , Header.dim(1),Header.dim(2),Header.dim(3)), v ,...
        [AnalyDir,filesep,'Results',filesep,'ALFF',...
        filesep,sublist5(i).name,filesep,['mALFF_' sublist5(i).name '.nii']]) ;

  
   
   end 
end    
     
%% Coregister T1 and ALFF to FA
      if get(handles.ckbALFFFA,'value')
          fprintf('Transfer ALFF to FA space by T1 image...\n')  ; 
          ALFFfolder = get(handles.editzALFF,'String') ;
          DTIdir = get(handles.editDTI,'String') ;
          alffdir = [AnalyDir,filesep,'Results',filesep,ALFFfolder];
            sublist5 = dir (alffdir) ;  
        parfor i = 3 : length(sublist5)
             fun = dir ([alffdir,filesep,sublist5(i).name,filesep,'mALFF*.nii']) ;
             copyfile ([alffdir,filesep,sublist5(i).name,filesep,fun(1).name],...
                       [alffdir,filesep,sublist5(i).name,filesep,['r' fun(1).name]]) ;
             OtherData = [alffdir,filesep,sublist5(i).name,filesep,['r' fun(1).name]] ;
  
          
             tpath = [AnalyDir,filesep,'T1ImgCoreg']  ;
             t1 = dir ([tpath,filesep,sublist5(i).name,filesep,'co*']) ;
          
             mkdir([AnalyDir,filesep,'T1ImgCoreg2FA',filesep,sublist5(i).name]) ;
             copyfile ([AnalyDir,filesep,'T1ImgCoreg',filesep,sublist5(i).name,filesep,t1(1).name],...
                      [AnalyDir,filesep,'T1ImgCoreg2FA',filesep,sublist5(i).name,filesep,t1(1).name]) ;
             SouData = [AnalyDir,filesep,'T1ImgCoreg2FA',filesep,sublist5(i).name,filesep,t1(1).name] ;
          
            if exist ([DTIdir,filesep,sublist5(i).name,filesep,'*FA.nii']) 
                FA = dir ([DTIdir,filesep,sublist5(i).name,filesep,'*FA.nii']) ;
                RefData = [DTIdir,filesep,sublist5(i).name,filesep,FA(1).name] ;
             else
                FA = dir ([DTIdir,filesep,sublist5(i).name,filesep,'*FA.nii.gz']) ;
                gunzip ([DTIdir,filesep,sublist5(i).name,filesep,FA(1).name])
                RefData = [DTIdir,filesep,sublist5(i).name,filesep,FA(1).name(1:end-3)] ;
            end
           
              TMScoregister (RefData,SouData,OtherData)  ;
          end     
      end
    
    
    
    
    


% --- Executes on button press in ckbSmooth.
function ckbSmooth_Callback(hObject, eventdata, handles)
% hObject    handle to ckbSmooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckbSmooth



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


% --- Executes on button press in ckbalff.
function ckbalff_Callback(hObject, eventdata, handles)
% hObject    handle to ckbalff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckbalff



function editTR_Callback(hObject, eventdata, handles)
% hObject    handle to editTR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTR as text
%        str2double(get(hObject,'String')) returns contents of editTR as a double


% --- Executes during object creation, after setting all properties.
function editTR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDTI_Callback(hObject, eventdata, handles)
% hObject    handle to editDTI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDTI as text
%        str2double(get(hObject,'String')) returns contents of editDTI as a double


% --- Executes during object creation, after setting all properties.
function editDTI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDTI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pshbDTI.
function pshbDTI_Callback(hObject, eventdata, handles)
% hObject    handle to pshbDTI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DTIDir = spm_select(1,'dir','please the analytic directory')
    if ischar(DTIDir),
		set(handles.editDTI,'String',DTIDir)
    end

% --- Executes on button press in rdbFAdir.
function rdbFAdir_Callback(hObject, eventdata, handles)
% hObject    handle to rdbFAdir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdbFAdir


% --- Executes on button press in ckbALFFFA.
function ckbALFFFA_Callback(hObject, eventdata, handles)
% hObject    handle to ckbALFFFA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckbALFFFA



function editzALFF_Callback(hObject, eventdata, handles)
% hObject    handle to editzALFF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editzALFF as text
%        str2double(get(hObject,'String')) returns contents of editzALFF as a double


% --- Executes during object creation, after setting all properties.
function editzALFF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editzALFF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
