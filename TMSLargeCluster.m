function  TMSLargeCluster(FCImgDir,P_df,type)
%% define the target using voxel p and cluster size
      [OutDir name ext] = fileparts(FCImgDir);
      [fchead fcdata] = TMSReadNii(FCImgDir) ;  % individual space
      FCImgDir
      max(fcdata)
      min(fcdata)
      VoxThr = invpearson(P_df(1),P_df(2))
      if strcmp(type,'Positive')
         fcdata(find(fcdata < VoxThr))=0;
      elseif strcmp(type,'Negative')
         fcdata=(-1)*fcdata ;
         fcdata(find(fcdata < VoxThr))=0;
      end
       fcdata(isnan(fcdata))=0;

%       if sum(fcdata)==0
%          error('Error using ==> No voxel survive the threshold');
%       end
      if sum(fcdata)
           [theObjMask, theObjNum]=bwlabeln(reshape(fcdata,fchead.dim(1),fchead.dim(2),fchead.dim(3)),26); 
	     for x=1:theObjNum,
		    theCurrentCluster = theObjMask==x;
		    ClusterSize(x,1) = length(find(theCurrentCluster)) ;
         end	
        [maxa maxb] =max(ClusterSize); % get the cluster with largest number of voxels
        fcdataout = zeros(size(fcdata)) ;
        theCurrentCluster = theObjMask==maxb ;
        fcdataout(find(theCurrentCluster))=fcdata(find(theCurrentCluster)) ;
        fcdataout(find(fcdataout))=1;
        TMSWriteNii(reshape(fcdataout,fchead.dim(1),fchead.dim(2),fchead.dim(3)),fchead,[OutDir,filesep,'FCinROICt.nii']) ;
      else
          fprintf('\n Largest cluster was not reported since no voxel survive the threshold.\n'); 
      end
      