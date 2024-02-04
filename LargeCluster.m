function dataout = LargeCluster(data, dim1, dim2, dim3)
  [theObjMask, theObjNum]=bwlabeln(reshape(data, dim1, dim2, dim3),26); 
	     for x=1:theObjNum,
		    theCurrentCluster = theObjMask==x;
		    ClusterSize(x,1) = length(find(theCurrentCluster)) ;
         end	
        [maxa maxb] =max(ClusterSize); % get the cluster with largest number of voxels
        dataout = zeros(size(data)) ;
        theCurrentCluster = theObjMask==maxb ;
        dataout(find(theCurrentCluster))=data(find(theCurrentCluster)) ;
        dataout(find(dataout))=1;