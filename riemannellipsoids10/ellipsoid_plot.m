function fc = ellipsoid_plot(length_y,sigmaf,rho,fc,numpics)
volume = 4/3*pi;

[Rf, ~, ~, ~] = get_axes(length_y, sigmaf, rho);


Xx = zeros(1,numpics);
Yx = zeros(1,numpics);
Zx = zeros(1,numpics);
Xy = zeros(1,numpics);
Yy = zeros(1,numpics);
Zy = zeros(1,numpics);
Xz = zeros(1,numpics);
Yz = zeros(1,numpics);
Zz = zeros(1,numpics);

for i = 1:int16(length_y/numpics):length_y
    sigmatmp = sigmaf{i};
    invsigmatmp = sigmatmp^(-1);
    Rtmp = Rf{1,i};
    Xx(i) = 2*Rtmp(1,1);
    Yx(i) = 2*Rtmp(2,1);
    Zx(i) = 2*Rtmp(3,1);
    Xy(i) = 2*Rtmp(1,2);
    Yy(i) = 2*Rtmp(2,2);
    Zy(i) = 2*Rtmp(3,2);
    Xz(i) = 2*Rtmp(1,3);
    Yz(i) = 2*Rtmp(2,3);
    Zz(i) = 2*Rtmp(3,3);

    f = @(X,Y,Z) invsigmatmp(1,1)*X.*X + 2*invsigmatmp(1,2)*X.*Y + 2*invsigmatmp(1,3)*X.*Z ...
                 + 2*invsigmatmp(2,3)*Y.*Z + invsigmatmp(2,2)*Y.*Y + invsigmatmp(3,3)*Z.*Z ...
                 - 5/(rho*volume);
    figure(fc);
    fimplicit3(f,[-6 6]);
    axis([-6 6 -6 6 -6 6]);
    grid on
    pbaspect([1 1 1])
    hold on
    arrow3([-Xx(i) -Yx(i) -Zx(i)], [Xx(i) Yx(i) Zx(i)],'r')
    hold on
    arrow3([-Xy(i) -Yy(i) -Zy(i)], [Xy(i) Yy(i) Zy(i)],'b')
    hold on
    arrow3([-Xz(i) -Yz(i) -Zz(i)], [Xz(i) Yz(i) Zz(i)],'k')
    hold off
end

fc = fc + 1;
end