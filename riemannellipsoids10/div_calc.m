function fc = div_calc(length_y,t,Mf, sigmaf,fc) 

xi = zeros(1,length_y);
for j = 1:length_y
    xi(j) = trace(inv(sigmaf{j})*Mf{j});
end

figure(fc)
fc = fc + 1;
plot(t,xi)
title('xi: Divergence of the Velocity Field')

end