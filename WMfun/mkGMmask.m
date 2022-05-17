function gmmask = mkGMmask(funimg, t1img, GMSegThr, WriteOut)
% funimg=[path2,filesep,list1(i).name,filesep,imglist2(1).name]
% t1path=[path1,filesep,list1(i).name]

[t1path, name, ext, versn] = fileparts(t1img) ; 
gmmask1= TMSreslice(funimg,t1img,[],0) ; % no out img was written, so the output dir is meaningless
gmmask = reshape(gmmask1, size(gmmask1,1)*size(gmmask1,2)*size(gmmask1,3),1) ; 

submask1 = TMSreslice(funimg,[t1path,filesep,'wHOAsub25prob.nii'],[],0) ; 
submask = reshape(submask1, size(gmmask1,1)*size(gmmask1,2)*size(gmmask1,3),1) ;
gmmask(find(gmmask<GMSegThr)) = 0 ;
gmmask = gmmask+submask;
gmmask(find(gmmask)) = 1 ;

if WriteOut==1
   [v data] =TMSReadNii(funimg) ; 
  TMSWriteNii(reshape(gmmask, size(gmmask1,1),size(gmmask1,2),size(gmmask1,3)),...
        v ,[t1path,filesep,'GMmask.nii']) ;
end
