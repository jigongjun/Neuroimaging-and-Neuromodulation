function OutVolume=TMSreslice(SampleDir,DataDir,OutDir,WriteOut)
%Resample 3D matrix, such as in REST mask resampling operation
%-----------------------------------------------------------
%	Copyright(c) 2016~2020
%	Department of Psychology, Anhui Medical University
%	Written by Gong-Jun JI 
% 	<a href="jigongjun@163.com">Mail to Author</a>: Gong-Jun JI 
%-----------------------------------------------------------
%   SampleDir -- image provide header infomation
%   DataDir -- image to be resliced
%   OurDir -- where the resliced image would be saved
%   cc = 0 (this default setting represents nearest interploation) 
if nargin==3
    WriteOut=1;
end
cc=0;
    SampleHeader = spm_vol(SampleDir) ;
    [SampleVol,SampleXYZ] = spm_read_vols(SampleHeader)  ;
    
   DataHeader = spm_vol(DataDir) ;
   [DataVol,DataXYZ] = spm_read_vols(DataHeader)  ;
      
 %% Modified from REST software: http://www.restfmri.net
 if  WriteOut==1
    mat=SampleHeader.mat;
    dim=SampleHeader.dim;
 else                                             % this condition was added to keep the space, just change the voxel size
    origin=DataHeader.mat(1:3,4);
%     NewVoxSize = [SampleHeader.dim(1) SampleHeader.dim(2) SampleHeader.dim(3)] 
      NewVoxSize = sqrt(sum(SampleHeader.mat(1:3,1:3).^2)); ;
    origin=origin+[DataHeader.mat(1,1);DataHeader.mat(2,2);DataHeader.mat(3,3)]-[NewVoxSize(1)*sign(DataHeader.mat(1,1));NewVoxSize(2)*sign(DataHeader.mat(2,2));NewVoxSize(3)*sign(DataHeader.mat(3,3))];
    origin=round(origin./NewVoxSize').*NewVoxSize';
    mat = [NewVoxSize(1)*sign(DataHeader.mat(1,1))                 0                                   0                       origin(1)
        0                         NewVoxSize(2)*sign(DataHeader.mat(2,2))              0                       origin(2)
        0                                      0                      NewVoxSize(3)*sign(DataHeader.mat(3,3))  origin(3)
        0                                      0                                   0                          1      ]

    dim=(DataHeader.dim-1).*diag(DataHeader.mat(1:3,1:3))';
    dim=floor(abs(dim./NewVoxSize))+1
 end

[x1,x2,x3] = ndgrid(1:dim(1),1:dim(2),1:dim(3));
d     = [cc*[1 1 1]' [1 1 0]'];
C = spm_bsplinc(DataHeader, d);
v = zeros(dim);

M = inv(DataHeader.mat)*mat; % M = inv(mat\SourceHead.mat) in spm_reslice.m
y1   = M(1,1)*x1+M(1,2)*x2+(M(1,3)*x3+M(1,4));
y2   = M(2,1)*x1+M(2,2)*x2+(M(2,3)*x3+M(2,4));
y3   = M(3,1)*x1+M(3,2)*x2+(M(3,3)*x3+M(3,4));


OutVolume    = spm_bsplins(C, y1,y2,y3, d);

% Revised by YAN Chao-Gan 121214. Apply a mask from the source image: don't extend values to outside brain.
tiny = 5e-2; % From spm_vol_utils.c
Mask = true(size(y1));
Mask = Mask & (y1 >= (1-tiny) & y1 <= (DataHeader.dim(1)+tiny));
Mask = Mask & (y2 >= (1-tiny) & y2 <= (DataHeader.dim(2)+tiny));
Mask = Mask & (y3 >= (1-tiny) & y3 <= (DataHeader.dim(3)+tiny));

OutVolume(~Mask) = 0;

   OutHead=DataHeader;
   OutHead.mat      =  mat;
  OutHead.dim(1:3) = dim;
  [pathx, fnamex, extensionx] = fileparts(DataDir) ;
  OutHead.fname    = [OutDir,filesep,strcat('r',fnamex,extensionx)] ;
  spm_write_vol(OutHead,OutVolume);
fprintf('Reslice Done \n')




