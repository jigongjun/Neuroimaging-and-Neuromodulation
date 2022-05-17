function [ClasScor sensi speci accur auc] = TMSGFCClass(CCmatrix,NumG1)

left_mat2 = CCmatrix ; % it is a 'coefficient' by 'subj number' matix
NumG1 ;              % it is the number of group1, usually the control group

for leftout =1 : size(left_mat2,2)
%   fprintf('\n Leaving out subj # %6.3f',leftout);
    % leave out subject from matrices and behavior
    left_vcts =left_mat2;
    left_vcts(:,leftout) =[] ;
    seed_vcts =left_mat2(:,leftout) ;
    if leftout < NumG1+1  
% %     [r1 p1] = corr (left_vcts(:,NumG1:size(all_mats,3)-1)',beh,'type','Spearman') ;
%     [inda,indb,c] = find(p1>pthr)  ;
%     left_vcts(inda,:)  = [] ;
%     seed_vcts(inda,:)  = [] ;
%     
    left_vctsMean(:,1) = mean(left_vcts(:,1:NumG1-1),2) ;
    left_vctsMean(:,2) = mean(left_vcts(:,NumG1:size(left_mat2,2)-1),2) ;
    [r_mat,p_mat] = corr(left_vctsMean,seed_vcts);
    rr(:,:,leftout) = r_mat ;
    sort_mean(leftout,1) =  r_mat(1)-r_mat(2)  ;
    clear left_vctsMean r_mat p_mat
    else
%     beh1=beh ; beh1(leftout-NumG1) = [] ;
%     [r1 p1] = corr (left_vcts(:,NumG1+1:size(left_mat2,2)-1)',beh1,'type','Spearman') ;
%     [inda,indb,c] = find(p1>pthr)  ;
%     left_vcts(inda,:)  = [] ;
%     seed_vcts(inda,:)  = [] ;
           
    left_vctsMean(:,1) = mean(left_vcts(:,1:NumG1),2) ;
    left_vctsMean(:,2) = mean(left_vcts(:,NumG1+1:size(left_mat2,2)-1),2) ;
    [r_mat,p_mat] = corr(left_vctsMean,seed_vcts);
    rr(:,:,leftout) = r_mat ;
    sort_mean(leftout,1) = r_mat(1)-r_mat(2)  ;
        clear left_vctsMean r_mat p_mat
    end
end

sensi = size(find(sort_mean(1:NumG1,1)>0),1)/NumG1 ;
speci = size(find(sort_mean(NumG1+1:size(sort_mean,1),1)<0),1)/(size(sort_mean,1)-NumG1) ;
accur = (size(find(sort_mean(1:NumG1,1)>0),1)+size(find(sort_mean(NumG1+1:size(sort_mean,1),1)<0),1))/size(sort_mean,1)  ;

ClasScor = sort_mean        ;
sort_mean(NumG1+1:end,2)=1  ;
ROCout=roc_noFig(sort_mean)    ;
auc=ROCout.AUC ;


