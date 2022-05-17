function AFQplot(g1,g2,fbms,bundlename)
% function PlotShadow (RangScost,Scost,Net,g1,g2,g3)
if nargin<4
   bundlename= {'Left Thalmic Radiation','Right Thalmic Radiation'...
    'Left Corticospinal','Right Corticospinal', ...
    'Left Cingulum Cingulate','Right Cingulum Cingulate', ...
    'Left Cingulum Hippocampus',  'Right Cingulum Hippocampus',...
    'Callosum Forceps Major','Callosum Forceps Minor',...
    'Left IFOF','Right IFOF',...
    'Left ILF','Right ILF',...
    'Left SLF','Right SLF',...
    'Left Uncinate','Right Uncinate'...
    'Left Arcuate','Right Arcuate'}; 
end

RangScost= [1:1:100] ;
Scost=  [1:1:100];

for i = 1  :  size(fbms,2)
    
figure(i)
hold on
% A = squeeze(trackalff1(:,i,:))' ;
A = squeeze(fbms(:,i,:))' ;
fill([Scost,fliplr(Scost)],[mean(A(1:g1,RangScost))-std(A(1:g1,RangScost))/sqrt(g1-1),fliplr(mean(A(1:g1,RangScost))+std(A(1:g1,RangScost))/sqrt(g1-1))],'k','FaceAlpha',0.3,'LineStyle','none')
plot(Scost,mean(A(1:g1,RangScost)),'-ok','linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',4)


fill([Scost,fliplr(Scost)],[mean(A(g1+1:g1+g2,RangScost))-std(A(g1+1:g1+g2,RangScost))/sqrt(g2-1),fliplr(mean(A(g1+1:g1+g2,RangScost))+std(A(g1+1:g1+g2,RangScost))/sqrt(g2-1))],'r','FaceAlpha',0.3,'LineStyle','none')
plot(Scost,mean(A(g1+1:g1+g2,RangScost)),'-or','linewidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',4)
% 

xlim([min(Scost),max(Scost)])
% xlabel('Sparsity','fontsize',12,'fontname','Arial','fontweight','b')
ylabel(bundlename(1,i),'fontsize',12,'fontname','Arial','fontweight','b')
title(num2str(i),'fontsize',12,'fontname','Arial','fontweight','b')

end

