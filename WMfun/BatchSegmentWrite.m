%% coregist T1Img to mean*.nii
DataDir='/mnt/NCPL09/ReseachPlan/DTIanaly_PD';

[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m')); 
sublist = dir([DataDir,filesep,'FunImgAR'])

for sub =4 : length(sublist)
TempImg3 = dir([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,'ra*.nii'])  ;
[datab headb] = rest_ReadNiftiImage...
    ([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,TempImg3(1).name]) ;
rest_WriteNiftiImage (sum(datab,4)/size(datab,4),headb,...
    [DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,'meanraDAT.nii']) ;
   
TempImg1 = dir([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,'mean*.nii'])
RefData = [DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,TempImg1(1).name] ;

TempImg2 = dir([DataDir,filesep,'T1Img',filesep,sublist(sub).name,filesep,'co*.nii']) ;
SouData = [DataDir,filesep,'T1Img',filesep,sublist(sub).name,filesep,TempImg2(1).name] ;
 TMScoregister (RefData,SouData,{''}) ;  % coregist T1 to Fun mean image
delete (RefData)


for i = 1 : size(datab,4)
    tname = ['0000' num2str(i)] ;
rest_WriteNiftiImage (datab(:,:,:,i),headb,...
    [DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,['raSubX' tname(end-2:end)]]);
end
delete ([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,TempImg3(1).name]) ;
   TempImg4 = dir([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,'raSubX*.nii']) ;
   
    for i = 1  : length(TempImg4)
        OtherData(i,1)= {[DataDir,filesep,'FunImgAR',...
            filesep,sublist(sub).name,filesep,TempImg4(i).name ',1'] } ;
    end
TMScoregister ([ProgramPath,filesep,'template',filesep,'ch2.nii' ',1'] ,SouData,OtherData) ; % coregist T1 and fun to ch2.nii 
end



%% T1 segmentation DTL
for sub = 3 : length(sublist)
      TempImg5 = dir([DataDir,filesep,'T1Img',filesep,sublist(sub).name,'/co*.nii'])
      mkdir([DataDir,filesep,'T1ImgSeg']) ;
      mkdir([DataDir,filesep,'T1ImgSeg/',sublist(sub).name]) ;
      copyfile([DataDir,filesep,'T1Img',filesep,sublist(sub).name,filesep,TempImg5(1).name],...
          [DataDir,filesep,'T1ImgSeg/',sublist(sub).name])
     
 end
 T1dir = [DataDir,filesep,'T1ImgSeg'] ;
 TMSsegDTL(T1dir)  ;

%% Spatial normalization for fun image
   for sub = 4 : length(sublist)
       TempImg6 = dir([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,'ra*.nii'])  ;
    for i = 1  : length(TempImg6)
        ROIlist(i,1)= {[DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,TempImg6(i).name ',1'] } ;
    end
    MATlist = dir([DataDir,filesep,'T1ImgSeg',filesep,sublist(sub).name,filesep,'y*.nii']) ;
    TMSwriteDTL([DataDir,filesep,'T1ImgSeg',filesep,sublist(sub).name,filesep,MATlist(1).name],...
        ROIlist) ;
    
    mkdir([DataDir,filesep,'FunImgARW']) ;
    mkdir([DataDir,filesep,'FunImgARW/',sublist(sub).name]);
    [ProgramPath, fileN, extn] = fileparts(which('TMStarget.m')); 
sublist = dir([DataDir,filesep,'FunImgAR'])

    
    TempImg7 = dir([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,'wra*.nii']) ;
    for i = 1  : length(TempImg7)
        movefile([DataDir,filesep,'FunImgAR',filesep,sublist(sub).name,filesep,TempImg7(i).name],...
                 [DataDir,filesep,'FunImgARW',filesep,sublist(sub).name,filesep,TempImg7(i).name] );
    e[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m')); 
sublist = dir([DataDir,filesep,'FunImgAR'])
nd
    [AllVolume, VoxelSize, ImgFileList, Header, nVolumn]=rest_to4d([DataDir,filesep,'FunImgARW',filesep,sublist(sub).name])  ;
   
    mkdir([DataDir,filesep,'FunImgARW4d']) ;
    mkdir([DataDir,filesep,'FunImgARW4d/',sublist(sub).name]);
    rest_Write4DNIfTI(AllVolume,Header,...
         [DataDir,filesep,'FunImgARW4d',filesep,sublist(sub).name,filesep,'wraDATA.nii']);
   end
   end