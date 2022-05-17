function SubjNameComp
   T1ImgDir = uigetdir([],'Plese select one folder') ;
   FunImgDir = uigetdir([],'Plese select another folder') ;
   [DataDirT1  T1Img cc] = fileparts(T1ImgDir) ;
   [DataDirFun  FunImg cc] = fileparts(FunImgDir) ;

   t1list = dir([DataDirT1,filesep,T1Img]) ;
   funlist = dir([DataDirFun,filesep,FunImg]) ;
    
   if length(t1list)~=length(funlist)
       fprintf('\n The unmber of the elements were different \n')
       return
   end
    
    for i = 3  : length(t1list)
       dif(i-2,1) = strcmp(t1list(i).name,funlist(i).name);
    end
    [a b] = find(dif==0) ;
    if size(a,1)
      fprintf('\n Please check these names: \n') 
      for i = 1  : size(a,1)
      disp(t1list(a(i)+2).name)
      end
    else
      fprintf('\n Subjects in the two folders have the same name \n')   
    end

