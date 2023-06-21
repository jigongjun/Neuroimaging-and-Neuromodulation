function TMSimgcomp(imgdir,type)


img = dir ([imgdir,filesep,'*.nii'])  ;

Header = spm_vol([imgdir,filesep,img(1).name]) ;
[jVol,jXYZ] = spm_read_vols(Header)  ;

if type==1 %%represent sum
    for i = 2  :  length(img)
        Header = spm_vol([imgdir,filesep,img(i).name]) ;
        [jVol2,jXYZ] = spm_read_vols(Header)  ;
        jVol = jVol+jVol2 ;
    end
    Header.fname    =  [imgdir,filesep,'Sum.nii']  ;
    spm_write_vol(Header,jVol);

elseif type==2 %%represent sum
    for i = 2  :  length(img)
        Header = spm_vol([imgdir,filesep,img(i).name]) ;
        [jVol2,jXYZ] = spm_read_vols(Header)  ;
        jVol = jVol.*jVol2 ;
    end
     Header.fname    =  [imgdir,filesep,'CommonArea.nii']  ;
    spm_write_vol(Header,jVol);
end
