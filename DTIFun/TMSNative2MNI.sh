flirt -in Results/Fiber -ref T1Img/dataB -out Results/Fiber_T1Sp -init T1Img/FA2T1.mat -applyxfm
applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm_brain --in=Results/Fiber_T1Sp --warp=T1Img/T12MNItransf.nii.gz --out=Results/Fiber_MNISp
