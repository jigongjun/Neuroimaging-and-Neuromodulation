flirt -in dataB -ref ${FSLDIR}/data/standard/MNI152_T1_2mm_brain -omat T12MNIaffine.mat 
fnirt --in=dataB --aff=T12MNIaffine.mat --cout=T12MNItransf --config=T1_2_MNI152_2mm
invwarp -w T12MNItransf -o MNI2T1transf -r dataB
