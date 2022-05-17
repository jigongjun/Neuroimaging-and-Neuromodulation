function TMSsphereROI (MNICenter,ROIRadius,OutDir,SampleImage)
   
   
if nargin<2,
        error(' Error using ==> at least 2 arguments wanted.');
    elseif nargin==2
        OutDir=pwd;
     elseif nargin==3    
       [Samplepath, Samplefname, Sampleextension]  = fileparts(which('TMStarget')) ;
       SampleImage =[Samplepath,filesep,'template',filesep,'tpm',filesep,'grey333.nii'] ;
       fprintf('\nProducing sphere ROI with the same dimention and voxel size as :"%s"\n', SampleImage);
       
    elseif nargin>4
        error('Error using ==> Too many input');
end

[outpath, outfname, outextension]  = fileparts(OutDir) 


if length(SampleImage)==0
[Samplepath, Samplefname, Sampleextension]  = fileparts(which('TMStarget')) ;
       SampleImage =[Samplepath,filesep,'template',filesep,'tpm',filesep,'grey333.nii'] ;
       fprintf('\nProducing sphere ROI with the same dimention and voxel size as :"%s"\n', SampleImage);
end

SampleHeader =spm_vol(SampleImage) ;
% [SampleVol,XYZ] = spm_read_vols(SampleHeader)  ;
          VoxelSize = sqrt(sum(SampleHeader.mat(1:3,1:3).^2));
          temp=inv(SampleHeader.mat)*[0,0,0,1]';
          SampleOrigin=temp(1:3)';
          SampleDim = SampleHeader.dim ;
Mask=zeros(SampleDim) ;
if SampleHeader.mat(1,1) < 0   % control the side of ROI
    MatrixCenter =round(([-1 1 1].*MNICenter./VoxelSize) + SampleOrigin); % MNI to matrix coordinate
else
    MatrixCenter =round(([1 1 1].*MNICenter./VoxelSize) + SampleOrigin); % MNI to matrix coordinate
end
% EnlVoxNum = ceil(ROIRadius/sqrt(VoxelSize(1)^2+VoxelSize(2)^2+VoxelSize(3)^2))  ;

%% from rest software 
	radiusX =round(ROIRadius /VoxelSize(1));
	if (MatrixCenter(1)-radiusX)>=1 && (MatrixCenter(1)+radiusX)<=SampleDim(1)
		rangeX	=(MatrixCenter(1)-radiusX):(MatrixCenter(1)+radiusX);
	elseif (MatrixCenter(1)-radiusX)<1 && (MatrixCenter(1)+radiusX)<=SampleDim(1)
		rangeX	=1:(MatrixCenter(1)+radiusX);
	elseif (MatrixCenter(1)-radiusX)>=1 && (MatrixCenter(1)+radiusX)>SampleDim(1)
		rangeX	=(MatrixCenter(1)-radiusX):SampleDim(1);
	else
		rangeX =1:SampleDim(1);
	end
	
	radiusY =round(ROIRadius /VoxelSize(2));
	if (MatrixCenter(2)-radiusY)>=1 && (MatrixCenter(2)+radiusY)<=SampleDim(2)
		rangeY	=(MatrixCenter(2)-radiusY):(MatrixCenter(2)+radiusY);
	elseif (MatrixCenter(2)-radiusY)<1 && (MatrixCenter(2)+radiusY)<=SampleDim(2)
		rangeY	=1:(MatrixCenter(2)+radiusY);
	elseif (MatrixCenter(2)-radiusY)>=1 && (MatrixCenter(2)+radiusY)>SampleDim(2)
		rangeY	=(MatrixCenter(2)-radiusY):SampleDim(2);
	else
		rangeY =1:SampleDim(2);
	end
	
	radiusZ =round(ROIRadius /VoxelSize(3));
	if (MatrixCenter(3)-radiusZ)>=1 && (MatrixCenter(3)+radiusZ)<=SampleDim(3)
		rangeZ	=(MatrixCenter(3)-radiusZ):(MatrixCenter(3)+radiusZ);
	elseif (MatrixCenter(3)-radiusZ)<1 && (MatrixCenter(3)+radiusZ)<=SampleDim(3)
		rangeZ	=1:(MatrixCenter(3)+radiusZ);
	elseif (MatrixCenter(3)-radiusZ)>=1 && (MatrixCenter(3)+radiusZ)>SampleDim(3)
		rangeZ	=(MatrixCenter(3)-radiusZ):SampleDim(3);
	else
		rangeZ =1:SampleDim(3);
	end
	
	for x=rangeX, for y=rangeY, for z=rangeZ,
		%Ball Definition, Computing within a cubic to minimize the time to be consumed
		if norm(([x, y, z] -MatrixCenter).*VoxelSize)<=ROIRadius,
			Mask(x, y, z) =1;
		end
	end; end; end;

if ~size(outextension,1)
   SampleHeader.fname = [OutDir,filesep,'SphereROI1.nii'] ;
   spm_write_vol(SampleHeader,Mask) ;

   SampleHeader.fname = [OutDir,filesep,'SphereROI2.nii'] ;
   spm_write_vol(SampleHeader,Mask.*255) ;
   fprintf('\nTwo sphere ROI have been saved at:"%s"\n',OutDir);
else
   SampleHeader.fname = OutDir ;
   spm_write_vol(SampleHeader,Mask) ;
   fprintf('\nA sphere ROI has been saved at:"%s"\n',OutDir);
end



