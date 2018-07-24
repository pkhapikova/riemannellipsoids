function fc = energy_calc(length_y,t, Mf, sigmaf, fc,rho,G)

[~,at,bt,ct] = get_axes(length_y, sigmaf, rho);

% kinetic energy
KE = zeros(length_y,1);
for i = 1:length_y
    KE(i) = 1/2*trace(Mf{i}'*inv(sigmaf{i})*Mf{i});
end

% Self-gravitating potential energy
I = zeros(length_y,1);
V = zeros(length_y,1);
E = zeros(length_y,1);
for i = 1:length_y
    func = @(x) 1./sqrt((at(i).^2+x).*(bt(i).^2+x).*(ct(i).^2+x));
    I(i) = integral(func, 0, Inf, 'RelTol',1e-12,'AbsTol',1e-12);
    V(i) = - 3/10*(rho.*4/3*pi*at(i).*bt(i).*ct(i))^2*G.*I(i);
    %V(i) = 3/10*(4/3*pi*at(i)*bt(i)*ct(i)).^2*rho*G*I(i);
    E(i) = KE(i) + V(i); %E is total energy
end

%graph of total energy
figure(fc)
fc = fc + 1;
plot(t,E)
title('Total Energy')
   
%graph of potential energy

figure(fc)
fc = fc + 1;
plot(t,KE,'r')
hold on
title('Kinetic Energy (red) and Potential Energy (blue)') 
plot(t,V, 'b')
hold off

end