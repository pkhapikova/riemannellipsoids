function fc = plot_axes(t,at,bt,ct,fc)

figure(fc)
plot(t,at,'r')
hold on
plot (t,bt,'g')
hold on
plot (t,ct,'b')
title('Lengths of axes over time')
legend('a','b','c')
hold off
fc = fc+1;

end
