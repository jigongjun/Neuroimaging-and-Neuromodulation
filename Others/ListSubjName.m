function ListSubjName(SubjsDir)
if nargin==0
  SubjsDir= uigetdir([],'select a input folder') ;
end
    
    [DirPath, fileN, extn] = fileparts(SubjsDir);

list = dir (SubjsDir) ;

if exist ([SubjsDir,filesep,'SubjList.txt'])
   delete ([SubjsDir,filesep,'SubjList.txt']) ;
end

cd(DirPath)

for i = 3 : length(list)
    fp=fopen('SubjList.txt','a')
    fprintf(fp,'%s \r\n',[list(i).name]) ;
    fclose(fp)
end


