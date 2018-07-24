function [Rf, a, b, c] = get_axes(length_y, sigmaf, rho)
volume = 4/3*pi;
Rf{length_y} = cell(length_y,1);
Df{length_y} = cell(length_y,1);
a = zeros(length_y,1);
b = zeros(length_y,1);
c = zeros(length_y,1);

for j = 1:length_y 
    [Rf{j}, Df{j}] = eig(sigmaf{j});
    a(j) = (Df{j}(1,1)*5/(rho*volume))^0.5; 
    b(j) = (Df{j}(2,2)*5/(rho*volume))^0.5; 
    c(j) = (Df{j}(3,3)*5/(rho*volume))^0.5;
end

end