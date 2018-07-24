function ellipsoid_gif(length_y)
fig = figure(20);
axis tight manual
numGraphs = 1:int16(length_y/250):length_y;
lenGraphs = length(numGraphs);
for idx = 1:lenGraphs
    f{i} = @(X,Y,Z) [X Y Z] * inv(sigmaf{i}) * [X Y Z]' - 5/(rho*volume);
    fimplicit3(f{i},[-10 10]);
    title('ellipsoid')
    drawnow
    frame = getframe;
    [im,map] = rgb2ind(frame.cdata,256,'nodither');
end
close;
figure(20);
%for idx = 1:lenGraphs
%    subplot(3,3,idx)
%    imshow(im(idx));
%end
filename = 'testellipsoid.gif'; % Specify the output file name
for idx = 1:lenGraphs
    [A,map] = rgb2ind(im(idx),256);
    if idx == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1)
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1)
    end
end



% h = figure(20);
% axis([-2 2 -2 2 -2 2])
% filename = 'testellipsoid.gif';
% for i = 1:int16(length_y/20):length_y
%     f{i} = @(X,Y,Z) [X Y Z] * inv(sigmaf{i}) * [X Y Z]' - 5/(rho*volume);
%     fimplicit3(f{i},[-10 10]);
%     drawnow
%     frame = getframe(h);
%     im = frame2im(frame);
%     [imind,cm] = rgb2ind(im,256);
    
    if i == 1 
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf);
    else
        imwrite(imind,cm,filename, 'gif', 'WriteMode', 'append');
    end
end

end