function TMSWriteNii(dat,vm,outname)
% Modified from DynamicBC 201810Version

datdims = size(dat);
if length(datdims)==3
    v1 = vm(1);
    v1.dt = [16,0];
    v1.n=[1,1];
    v1.fname = outname;
    spm_write_vol(v1,dat);
elseif length(datdims)==4
    for i = 1:datdims(4)
        v1(i) = vm(1);
        v1(i).dt = [16,0];
        v1(i).n=[i,1];
        v1(i).fname = outname;
        spm_write_vol(v1(i),squeeze(dat(:,:,:,i)));
    end
else
    error(['wrong input data set with ',num2str(length(datdims)),' dims']);
end
