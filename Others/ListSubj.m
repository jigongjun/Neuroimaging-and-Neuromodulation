function ListSubj(SubjsDir,outname)

if nargin==0
  SubjsDir= uigetdir([],'select a input folder') ;
  outname='SubjList.txt' ;
elseif nargin==1
    outname='SubjList.txt' ;
end

[DirPath, fileN, extn] = fileparts(SubjsDir);

list = dir (SubjsDir) ;

% if exist ([SubjsDir,filesep,'SubjList.txt'])
%    delete ([SubjsDir,filesep,'SubjList.txt']) ;
% end
% cd(DirPath)

for i = 3 : length(list)
    fp=fopen([DirPath,filesep,outname],'a') ;
%     fprintf(fp,'%s \r\n',[list(i).name]) ;
    fprintf(fp,'%s\r\n',[list(i).name]) ;
    fclose(fp) ;
end


