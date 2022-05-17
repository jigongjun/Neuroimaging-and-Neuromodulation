
function TMSExtendROI(ROIDataDir,EnlVolNum)

ROIHeader =spm_vol(ROIDataDir) ;
[ROIData,XYZ] = spm_read_vols(ROIHeader)  ;
tdata  =  ROIData   ;
header.dim(1)=size(ROIData,1);
header.dim(2)=size(ROIData,2);
header.dim(3)=size(ROIData,3);
i=0;
while i  <  EnlVolNum

    for ii= 2: header.dim(1)-1
        for ij= 2 : header.dim(2)-1
            for ik= 2 : header.dim(3)-1
                
                if ROIData(ii,ij,ik)>0
                    count_temp=sum(sum(sum(ROIData(ii-1:ii+1,ij-1:ij+1,ik-1:ik+1))));
                    if count_temp<27
                         tdata(ii-1:ii+1,ij-1:ij+1,ik-1:ik+1)=1;
                    end;
                end
                  
            end;
        end;
    end;
     i=i+1;
     ROIData=tdata;
end
ROIHeader.fname = ['EnlargedROI.nii'] ;
% SampleHeader.dt = [8 0] ;
spm_write_vol(ROIHeader,tdata) ;