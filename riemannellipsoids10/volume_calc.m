function [Vol fc] = volume_calc(length_y, t, at, bt, ct,fc)

Vol = zeros(length_y,1);

for i = 1:length_y
    Vol(i) = (4*pi/3)*at(i)*bt(i)*ct(i);
end

figure(fc)
fc = fc + 1;
plot(t, Vol)
title('Total Volume')
    
end