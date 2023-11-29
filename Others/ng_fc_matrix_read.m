function matrix = ng_fc_matrix_read(path)

matrix = importdata(path);

pat = '\[|\]|\,|\s';
mat_sub=regexp(matrix{1}, pat, 'split');
mat_sub(cellfun(@isempty,mat_sub))=[];

num = sqrt(length(mat_sub));
mat = reshape(mat_sub,num,num);

matrix = zeros(size(mat));
for i = 1:size(mat,1)
    for j = 1:size(mat,2)
        matrix(i,j) = str2num(mat{i,j});
    end
end






