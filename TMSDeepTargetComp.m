function TMSDeepTargetComp (t1dir,outdir,coord,roiradius,depthx)
%% example for input parameters 
t1dir = 'E:\tt\wc1co3.nii'     % the pathway of your c1co*.nii in MNI space
outdir= 'E:\tt'                % folder saving associating results
coord = [-35.06 -8.97 79.47]   % MNI coordinate 
% this funciton was based on REST, TMStarget, and SPM
% the output is a txt named 'ResCoord.txt'
%%
if nargin<3,
        error(' Error using ==> at least 2 arguments wanted.');
     elseif nargin==3    
       roiradius = 40           % default value, computing within a sphere mask with 40 mmradius.
       depthx = 6              % deault vaule, distance from cortical target to deep target
    elseif nargin>5
        error('Error using ==> Too many input');
end
%%
cd (outdir) ;
TMSsphereROI (coord,roiradius,outdir,t1dir);
[t1data t1voxel t1head] = rest_readfile (t1dir) ;
[dim1 dim2 dim3] =size(t1data)  ;
VoxelSize = sqrt(sum(t1head.mat(1:3,1:3).^2));
t1head.dt=[16 0] ;
[mdata mvoxel mhead]  = rest_readfile ('SphereROI1.nii') ;
data1 = t1data.*mdata ; 
data2 = reshape(data1,dim1*dim2*dim3,1) ;
jdist=zeros(size(mdata)) ;
jdist(:,:,:)=10000 ;
for i = 1  : dim1*dim2*dim3
   if data2(i,1) > 0
       [a b c] = ind2sub(size(t1data),i) ;
       if t1head.mat(1,1) < 0
       jdist(a,b,c) = pdist([round(([-1 1 1].*coord./VoxelSize) + t1head.Origin); [a b c]],'euclidean') ;
       else
       jdist(a,b,c) = pdist([round(([1 1 1].*coord./VoxelSize) + t1head.Origin); [a b c]],'euclidean') ;    
   end
   end
end
 min_x = min(jdist(:))  ;
 lin = find(jdist==min_x) ;
 [a b c] = ind2sub(size(jdist),lin) ;
 if t1head.mat(1,1) < 0
 cortcoord = ([a(1) b(1) c(1)] - t1head.Origin).*[-1 1 1].*VoxelSize ;
 else
 cortcoord = ([a(1) b(1) c(1)] - t1head.Origin).*[1 1 1].*VoxelSize ;   
 end
% rest_WriteNiftiImage(data1,t1head,'ComputMask.nii') ;
delta = ([coord-cortcoord]./(pdist([coord; cortcoord],'euclidean')))*depthx ;
ResCoord = cortcoord - [sign(cortcoord)] .* delta  ;
save ('ResCoord.txt','ResCoord','-ascii') ;

delete([outdir,filesep,'SphereROI1.nii']) ;
delete([outdir,filesep,'SphereROI2.nii']) ;
% rest_WriteNiftiImage(jdist,t1head,'tMask.nii') ;
