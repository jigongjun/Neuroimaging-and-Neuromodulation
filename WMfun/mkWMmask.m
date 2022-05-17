function wmmask = mkWMmask(funimg, t1img, WMSegThr, WriteOut)
% funimg=[path2,filesep,list1(i).name,filesep,imglist2(1).name]
% t1path=[path1,filesep,list1(i).name]

[t1path, name, ext, versn] = fileparts(t1img) ; 
wmmask1= TMSreslice(funimg,t1img,[],0) ; % no out img was written, so the output dir is meaningless
wmmask = reshape(wmmask1, size(wmmask1,1)*size(wmmask1,2)*size(wmmask1,3),1) ; 

submask1 = TMSreslice(funimg,[t1path,filesep,'wHOAsub25prob.nii'],[],0) ; 
submask = reshape(submask1, size(wmmask1,1)*size(wmmask1,2)*size(wmmask1,3),1) ;
wmmask(find(submask)) = 0 ; 
wmmask(find(wmmask<WMSegThr)) = 0 ;
wmmask(find(wmmask)) = 1 ;
if WriteOut==1
   [v data] =TMSReadNii(funimg) ; 
  TMSWriteNii(reshape(wmmask, size(wmmask1,1),size(wmmask1,2),size(wmmask1,3)),...
        v ,[t1path,filesep,'WMmask.nii']) ;
end
