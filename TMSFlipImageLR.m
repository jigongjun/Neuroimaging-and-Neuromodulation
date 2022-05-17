function TMSFlipImageLR(ImageDir,OutputDir)
if  nargin<1,
ImageDir = spm_select(1,'Image','Selecting the iamge need flip...')
OutputDir = spm_select(1,'Dir','Selecting the output dir...')
end
ImageHeader =spm_vol(ImageDir) ;
 [ImageVol,ImageXYZ] = spm_read_vols(ImageHeader)  ;
Dim1 = size (ImageVol,1) ;  Dim2 = size (ImageVol,2) ;  Dim3 = size (ImageVol,3) ;
TempVol = zeros(size(ImageVol)) ;

TempVol(1:1:Dim1,:,:) = ImageVol(Dim1:-1:1,:,:)  ;
%     IempVol=flipdim(ImageVol,1) ;
[Tpath, Tfname, Textension] = fileparts(ImageHeader.fname) ;
ImageHeader.fname = [OutputDir,filesep,Tfname 'Fliped.nii'] 
spm_write_vol(ImageHeader,TempVol) ;



