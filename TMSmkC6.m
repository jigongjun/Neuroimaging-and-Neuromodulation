function TMSmkC6(subjdir) 
%% delete the noise of the DARTEL c6
%% 1. find t1 voxels with low intensity (e.g., arbitrary threshold 1000). This also highlighed within brain voxels, such as CSF
%% 2. only keep the largest cluster in the result map of step1. These were performed one slice by one slice in three dimention
     [c6head c6data] =TMSReadNii([subjdir,filesep,'ac_coT1.nii'])  ;  
    c6data=reshape(c6data,c6head.dim(1),c6head.dim(2),c6head.dim(3));
     c6data(find(c6data<1000))=1;      %% the threshold 1000 was defined arbitrary
     c6data(find(c6data>=1000))=0;  
%      c6data(find(c123))=0;
%      c6data(:,:,1: round(c6head.dim(3)*0.4) )=0;
%%
     for s = 1:c6head.dim(3)-1
         c6datas =  c6data(:,:,s:s+1) ;
         if size(find(c6datas),1) > 0
        c6datas_clear = LargeCluster(c6datas,c6head.dim(1), c6head.dim(2), 2) ;
         else
            c6datas_clear =  c6datas ;
         end
         c6data(:,:,s:s+1) = c6datas_clear ;
     end
     
     for s = 1: c6head.dim(2)-1
         c6datas =  c6data(:,s:s+1,:) ;
         if size(find(c6datas),1) > 0
        c6datas_clear = LargeCluster(c6datas,c6head.dim(1), 2, c6head.dim(3)) ;
         else
            c6datas_clear =  c6datas ;
         end
         c6data(:,s:s+1,:) = c6datas_clear ;
     end
     
     for s = 1 : c6head.dim(1)-1
         c6datas =  c6data(s:s+1,:,:) ;
         if size(find(c6datas),1) > 0
        c6datas_clear = LargeCluster(c6datas,2, c6head.dim(2), c6head.dim(3)) ;
         else
            c6datas_clear =  c6datas ;
         end
         c6data(s:s+1,:,:) = c6datas_clear ;
     end
     
     TMSWriteNii (c6data,c6head,[subjdir,filesep,'c6ac_coT1.nii']  ) ;
     
     