function [v,data] = TMSReadNii(sub_dir,filter_str)
% Modified from DynamicBC 201810Version


if nargin==1
    filter_str = '';
end
flag = 0;
[fpath,name,ext] = fileparts(sub_dir);
if strcmp(ext,'.nii')||strcmp(ext,'.img')||strcmp(ext,'.hdr')
    if strcmp(ext,'.hdr')
        niiname.name = [name,'.img'];
    else
        niiname.name = [name,ext];
    end
    sub_dir = fpath;
    flag = 1;
else
    niiname = dir(fullfile(sub_dir,[filter_str,'*.nii']));
    if isempty(niiname)
        niiname = dir(fullfile(sub_dir,[filter_str,'*.img']));
        if isempty(niiname)
            warning(['Warning: no NIFTI file exist in: ',sub_dir]);
        end
    end
end
num_volume = length(niiname) ;
if num_volume==1
    if flag==0
        disp(['only one file in: ',sub_dir])
    end
    niifile = fullfile(sub_dir,niiname.name);
    v = spm_vol(niifile);
    data = spm_read_vols(v);
    nobs = size(data,4);
    data = reshape(data,[],nobs); %nvar*nobs
else
    nobs = num_volume;
    tmp_dat = spm_read_vols(spm_vol(fullfile(sub_dir,niiname(1).name)));
    data = zeros(numel(tmp_dat),nobs); %nvar*nobs
    for j=1:nobs
        niifile = fullfile(sub_dir,niiname(j).name);
        v = spm_vol(niifile);
        tmp_dat = spm_read_vols(v);
        data(:,j) = tmp_dat(:);
    end
end
