function fc = gamma_calc(length_y,t,Mf, sigmaf, fc) 

gamma_squared = zeros(1,length_y);

for j = 1:length_y
    gamma_squared(j) = trace(inv(sigmaf{j})*Mf{j}*sigmaf{j}*(Mf{j})'...
        - Mf{j}*Mf{j});
end

figure(fc);
fc = fc +1;
plot(t,gamma_squared);
title('gamma squared')
end