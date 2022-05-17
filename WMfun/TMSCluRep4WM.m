function TMSCluRep4WM(ResMap,Template,OutDir)

% ResMap = '/mnt/NCPL09/dALFF/SnPM_result_zdALFF_0.01/SnPM_filtered+.nii'
% Template = 25  or 0
if nargin==2
    OutDir = pwd;
end
[ProgramPath, fileN, extn] = fileparts(which('TMStarget.m'));

% it provide two template with different probability tract 
if Template==25
    WMTemplate = [ProgramPath,filesep,'template',filesep,'JHUtractsThr25_3mm.nii'];
elseif Template==0
    WMTemplate = [ProgramPath,filesep,'template',filesep,'JHUtractsThr0_3mm.nii'];
end

[head1 ResData] = TMSReadNii (ResMap) ;
[head2 TPLData] = TMSReadNii (WMTemplate) ;
ResData(find(ResData>0))=1 ;
OutData = ResData.*TPLData ;

for i = 1 : 20
   countnum(i,1) =  size(find(OutData == i),1) ;
   TPLnum (i,1) =  size(find(TPLData == i),1) ;
end 
PercentWM = 100*countnum./TPLnum ;

if ~exist ([OutDir,filesep,'JHUtractsLabel.txt']) 
copyfile ([ProgramPath,filesep,'template',filesep,'JHUtractsLabel.txt'],...
    [OutDir,filesep,'JHUtractsLabel.txt'])  ;
end

if exist ([OutDir,filesep,'ResInJHUtracts.txt'])
    delete ([OutDir,filesep,'ResInJHUtracts.txt'])
end

%% output result as .txt
    fid = fopen([OutDir,filesep,'JHUtractsLabel.txt']) ; 
    fid2 = fopen([OutDir,filesep,'ResInJHUtracts.txt'],'a') ;
k=1 ;
    while k<21  % 20 tracts
       tline = [fgetl(fid) '  '  num2str(countnum(k)) '  ' num2str(PercentWM(k)) ]  ;
       fprintf(fid2,'%s \r\n',tline) ;
       k=k+1;
    end
  
    fclose(fid) ;
    fclose(fid2) ;
    
    
    
    
    
    