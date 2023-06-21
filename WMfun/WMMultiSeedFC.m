function FCMap = WMMultiSeedFC(FunDir,SeedDirS,MaskDir,OutDir)
% SeedDir is a structure 
% SeedDir={'a/s.nii';'d/ss.nii'}
if nargin==3
    OutDir=[];
end


[funhead fundata] = TMSReadNii(FunDir) ;
dim1 = funhead(1,1).dim(1); dim2=funhead(1,1).dim(2); dim3=funhead(1,1).dim(3);

if iscell(SeedDirS)
    
    
    for sn = 1: size(SeedDirS,1)*size(SeedDirS,2)
        SeedDir = SeedDirS{sn};
        [seeddirx,seedname,cc] = fileparts (SeedDir) ;
        
        shead  = spm_vol(SeedDir) ;
           if dim2~=shead.dim(2)
              sdata=TMSreslice(FunDir,SeedDir,[],0) ;
              sdata=reshape(sdata,dim1*dim2*dim3,1);
           else
              [shead sdata] = TMSReadNii(SeedDir)  ;
           end

        mhead  = spm_vol(MaskDir) ;
           if dim2~=mhead.dim(2)
              mdata=TMSreslice(FunDir,MaskDir,[],0) ;
              mdata=reshape(mdata,dim1*dim2*dim3,1);
           else
              [mhead mdata] = TMSReadNii(MaskDir) ;
           end
       mdata(find(mdata))=1 ;

% read seed signal

   SeedSig = repmat(sdata,[1,size(fundata,2)]).*fundata ;
   SeedSig(isnan(SeedSig))=0;
   SeedSignal = zscore(mean(SeedSig(find(sdata),:),1));%/sum(sdata(find(sdata))) ;

 % calculate FC map
    fprintf('\n\tCalculating seed-based functional connectivity...\n');
    fundatam = fundata(find(mdata),:) ;
    rValues=atanh(TMSfastCorr(SeedSignal',fundatam'));
    FCMap = zeros(size(mdata)) ;
    FCMap(find(mdata))=rValues;
    FCMapOut = reshape(FCMap,dim1,dim2,dim3) ;
    
    if length(OutDir)
    TMSWriteNii(FCMapOut,...
        shead,[OutDir,filesep,seedname '_zFCmap.nii']);
    end

    end   
    
    
    
else
    SeedDir=SeedDirS;
    [seeddirx,seedname,cc] = fileparts (SeedDir) ;
     shead  = spm_vol(SeedDir) ;
           if dim2~=shead.dim(2)
              sdata=TMSreslice(FunDir,SeedDir,[],1,0) ;
              sdata=reshape(sdata,dim1*dim2*dim3,1);
           else
              [shead sdata] = TMSReadNii(SeedDir)  ;
           end

        mhead  = spm_vol(MaskDir) ;
           if dim2~=mhead.dim(2)
              mdata=TMSreslice(FunDir,MaskDir,[],1,0) ;
              mdata=reshape(mdata,dim1*dim2*dim3,1);
           else
              [mhead mdata] = TMSReadNii(MaskDir) ;
           end
       mdata(find(mdata))=1 ;

% read seed signal

   SeedSig = repmat(sdata,[1,size(fundata,2)]).*fundata ;
   SeedSig(isnan(SeedSig))=0;
   SeedSignal = zscore(mean(SeedSig(find(sdata),:),1));%/sum(sdata(find(sdata))) ;

 % calculate FC map
    fprintf('\n\tCalculating seed-based functional connectivity...\n');
    fundatam = fundata(find(mdata),:) ;
    rValues=atanh(TMSfastCorr(SeedSignal',fundatam'));
    FCMap = zeros(size(mdata)) ;
    FCMap(find(mdata))=rValues;
    FCMapOut = reshape(FCMap,dim1,dim2,dim3) ;
    
    if length(OutDir)
    TMSWriteNii(FCMapOut,...
        funhead(1,1),[OutDir,filesep,seedname '_zFCmap.nii']);
    end
end