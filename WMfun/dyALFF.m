function dyALFF
path = '/mnt/NCPL09/ReseachPlan/DTIanaly_PD/FunImgProcessing/FunImgARTCwm'
mpath = '/mnt/NCPL09/ReseachPlan/DTIanaly_PD/FunImgProcessing/T1Img'
opath='/mnt/NCPL09/ReseachPlan/DTIanaly_PD/FunImgProcessing/dALFFmap'
list = dir(path);
step = 5 ;  winlen = 50; TR =2.4 ;
parfor i = 3 : length(list)
    mkdir([opath,filesep,list(i).name]) ;
    imgdir = fullfile(path,list(i).name,'fundata.nii');
    [head data] = TMSReadNii(imgdir) ;
    mask = fullfile(mpath,list(i).name, 'WMmask.nii')
    for j = 1 : step : size(data,2)-winlen
        allvol = data(:,j:j+winlen-1);
        TMSWriteNii(reshape(allvol,head(1).dim(1),head(1).dim(2),...
            head(1).dim(3),size(allvol,2)),head,...
            fullfile(opath,list(i).name,'temp.nii')) ;
        oname = ['00' num2str(j)]
        TMSfalff(fullfile(opath,list(i).name,'temp.nii'),...
            TR, 0.1, 0.01, mask,fullfile(opath,list(i).name,...
            ['ALFF' oname(end-2:end) '.nii'])) ;
    end
    
end

path1 = '/mnt/NCPL09/ReseachPlan/DTIanaly_PD/FunImgProcessing/dALFFmap'
list = dir(path1)
for i = 3 : length(list)
    img = dir([list(i).name,filesep,'mALFF*.nii']) ;
    for j = 1 : length(img)
        [head1 data1(:,j)] = TMSReadNii(fullfile(list(i).name,img(j).name)) ;
    end
    [ia ib] = find(data1(:,1));
    data2 = data1(ia,:);
    cv1=std(data2,0,2);%./mean(data2,2);
    data3=zeros(size(data1,1),1);
    data3(ia,1)=cv1;
TMSWriteNii(reshape(data3,head1.dim(1),head1.dim(2),...
    head1.dim(3)),head1,fullfile(list(i).name,['stdmalff.nii']))
end





