function MultiRunCalc(type)
f1 = uigetdir([],'select one folder') ;
ListSubj = uigetfile('.txt') ;
f3 = uigetdir([],'select output folder') ;
f1list = dir(f1) ;
Subj = importdata(ListSubj); % no '_Run*' in the list name


for i = 1 : length(Subj)
   csubj = 0 ; 
   mkdir([f3,filesep,Subj{i}]) ;
    for j = 3 : length(f1list)
       if strcmp(Subj{i},f1list(j).name(1:end-5))
           csubj =  csubj+1; % nunber of sessions
       end
    end
    
   data=[];
   if strcmp(type,'add')
     for c = 1 : csubj % joint all sessions
       [head data1] = TMSReadNii([f1,filesep,[Subj{i} '_Run' num2str(c)],filesep,'fundata.nii']) ;
       data1 = (data1-repmat(mean(data1')',[1,size(data1,2)])); %  demean
       data = [data data1];
     end
   elseif strcmp(type,'mean')
      for c = 1 : csubj % joint all sessions
       [head data1(:,:,c)] = TMSReadNii([f1,filesep,[Subj{i} '_Run' num2str(c)],filesep,'fundata.nii']) ;
      end 
      data = mean(data1,3) ;
   end

   TMSWriteNii(reshape(data,head(1).dim(1),head(1).dim(2),head(1).dim(3),size(data,2)),head,[f3,filesep,Subj{i},filesep,'fundata.nii']);
end
    




