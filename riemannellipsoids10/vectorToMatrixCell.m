function [Mf, sigmaf] = vectorToMatrixCell(y)

size_y = size(y);
length_y = size_y(1,1);
Mf = cell(length_y,1);
sigmaf = cell(length_y,1);

for i = 1:length_y
    Mf{i} = [y(i,1) y(i,2) y(i,3); y(i,4) y(i,5) y(i,6);...
        y(i,7), y(i,8), y(i,9)];
    sigmaf{i} = [y(i,10) y(i,11) y(i,12); y(i,11) y(i,13) y(i,14);...
        y(i,12), y(i,14), y(i,15)];
    
end

end