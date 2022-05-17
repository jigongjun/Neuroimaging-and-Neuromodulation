function TMSSloverSPM(imgs,outfilename,slices);

% % % % imgs{1} : 'struct imgage';
% % % % imgs{2} : 'overlay imgage';
% e.g. imgs = {'/Users/guorongwu/Downloads/spm12/canonical/avg152T1.nii';
% '/Users/guorongwu/Downloads/spm12/tpm/TPM.nii,2'}
% % % -----------------------------------------------------------------------
slices0 = {-60:5:60; 
        -60:5:60; 
        -60:5:70};
if nargin<2
    slices = slices0;
    outfilename = fullfile(pwd,'Overlap');
end
if nargin<3
    slices = slices0;
end

obj = slover;
obj.cbar = [];
prop = [1 0.4 1];
cmap= {gray; [[1 1 1]; jet]}; %%
for i=1:2
    obj.img(i).vol = spm_vol(imgs{i});
    [mx, mn] = slover('volmaxmin', obj.img(i).vol);
    obj.img(i).type = 'truecolour';
    obj.img(i).range = [mn mx];
    obj.img(i).prop = prop(i);
    obj.img(i).cmap = cmap{i};
    obj.img(i).backgroud = nan;
    obj.img(i).hold = 1;
    obj.img(i).outofrange = {1,256};
end

% flag_contours = 0; flag_only_contours = 1; %%
% 
% if flag_contours
%     obj.img(3) = obj.img(2);
%     obj.img(3).type = 'contour';
%     obj.img(3).range = [mx*0.1 mx] ;%%
% end
% 
% if flag_contours && flag_only_contours
%     obj.img(2) = obj.img(3);
%     obj.img(3) = [];
% end

% vi = {'Axial','Coronal','Sagittal'};
vi = {'Sagittal'};
obj0 = obj;
for i=1:length(vi)
    obj = obj0;
    obj.figure = spm_figure('GetWin', 'Graphics'); 
    obj.transform = vi{i};
    obj.slices =slices{i};
    paint(obj);
%     print([outfilename,'_',vi{i},'.png'],'-dpng', '-painters','-noui','-r300');
%     I=getframe(gcf);
%     imwrite (I.cdata,[outfilename,vi{i},'.bmp']);
% close(figure) ;
export_fig ([outfilename,vi{i},'.png'])
end

       


