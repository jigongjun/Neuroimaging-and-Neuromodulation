echo $1
echo $2 
cd $3
fslmerge -t Merged.nii.gz *
design_ttest2 design $1 $2 
randomise -i Merged.nii.gz -o Diff -m mask.nii.gz -d design.mat -t design.con -n 5000 -T
fsl2ascii Diff_tfce_corrp_tstat2.nii Corrp_tstat2
fsl2ascii Diff_tfce_corrp_tstat1.nii Corrp_tstat1
