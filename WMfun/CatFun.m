function MultiRunCalc
f1 = uigetdir([],'select one folder') ;
f2 = uigetfile('.txt') ;
f3 = uigetdir([],'select output folder') ;
f1list = dir(f1) ;
f2list = dir(f2) ;

parfor i = 3 : length(f1list)
    mkdir([f3,filesep,f1list(i).name]) ;
    [head data1] = TMSReadNii([f1,filesep,f1list(i).name,filesep,'fundata.nii']) ;
    [head data2] = TMSReadNii([f2,filesep,f2list(i).name,filesep,'fundata.nii']) ;
%     data1(isnan(data1))=0;
%     data2(isnan(data2))=0;
%     data1=(data1-repmat(mean(data1,1),[size(data1,1),1]))./repmat(max(data1),[size(data1,1),1]);
%     data2=(data2-repmat(mean(data2,1),[size(data2,1),1]))./repmat(max(data2),[size(data2,1),1]);
%     
%     data1=(data1-repmat(mean(data1')',[1,size(data1,2)]))./repmat(std(data1')',[1,size(data1,2)]);
%     data2=(data2-repmat(mean(data2')',[1,size(data2,2)]))./repmat(std(data2')',[1,size(data2,2)]);
    data1=(data1-repmat(mean(data1')',[1,size(data1,2)]));
    data2=(data2-repmat(mean(data2')',[1,size(data2,2)]));

    data = [data1 data2] ;
    TMSWriteNii(reshape(data,head(1).dim(1),head(1).dim(2),head(1).dim(3),...
        size(data,2)),head,[f3,filesep,f1list(i).name,filesep,'fundata.nii']);
end
    




