applywarp --ref=dataB --in=SeedImage --warp=MNI2T1transf.nii.gz --out=SeedImage_T1Sp
flirt -in SeedImage_T1Sp -ref FA -out SeedImage_NaSp -init T12FA.mat -applyxfm

applywarp --ref=dataB --in=TargetImage --warp=MNI2T1transf.nii.gz --out=TargetImage_T1Sp
flirt -in TargetImage_T1Sp -ref FA -out TargetImage_NaSp -init T12FA.mat -applyxfm
