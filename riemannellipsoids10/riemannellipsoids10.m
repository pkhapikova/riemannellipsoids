clc, close all; clear all;
%% Set some parameters and do basic integration
% input initial conditions (change)

tspan = [0 6*2*pi]; %set timespan

a = 0.8; %set axes
b = 1;
c = 1/(a*b);  
          
alpha = 0; %set velocity matric
beta = 0;
w1 = 0;
w2 = 0;
w3 = 0;
L = [alpha  w3      -w2;
     -w3    beta    w1;
     w2     -w1     -(alpha+beta)]; 
L = 0*L;          

%other misc constants, don't change
rho = 1;
G = 1/(2*pi*rho);
fc = 1;
               
volume = 4/3*a*b*c*pi;

theta = 0;  % can choose 0 w/o l.o.g.
phi =  0; % can choose 0 w/o l.o.g.

D = [1/a^2 0 0 ; 0 1/b^2 0 ; 0 0 1/c^2];
R = [cos(theta)*cos(phi) -sin(theta) -cos(theta)*sin(phi); ...
    sin(theta)*cos(phi) cos(theta) -sin(theta)*sin(phi); sin(phi) ...
    0 cos(phi)]; %rotation matrix

sigma = rho/5*volume*R*D^(-1)*R';
M = sigma*transpose(L);
sigmainv = inv(sigma);
invsigmahat = (sigmainv/trace(sigmainv));

%initial conditions for ode45
y0 = matrixToVector(sigma,M);

%integrate
options = odeset('RelTol',1e-12,'AbsTol',1e-10);
[t,y] = ode45(@(t,y)riemann(t,y,G,rho,volume), tspan, y0, options);  

%save data
filename = "a" + string(a) + "_w1=" + string(w1) + "_w2=" + string(w2) + "_w3=" + string(w3)+ ".mat";
save(filename, 't', 'y')

%set variables for later use
size_y = size(y);
length_y = size_y(1,1);

%graph y (M and sigma)
figure(fc)
fc = fc + 1;
plot(y)
title('y')

%make M and sigma from y (at each timestep)
[Mf, sigmaf] = vectorToMatrixCell(y);

%return rotation matrix and axes (at each timestep)
[Rf, at, bt, ct] = get_axes(length_y, sigmaf, rho);

%% Total Volume
%calculate and graph volume
[Vol, fc] = volume_calc(length_y,t,at,bt,ct,fc);

%% Gamma_squared
%calculate and graph gamma_squared
fc = gamma_calc(length_y,t, Mf, sigmaf, fc);

%% Divergence of the velocity field (xi)
%calcualte and graph divergence of velocity field
fc = div_calc(length_y,t,Mf, sigmaf, fc);

%% plot ellipsoid  
numpics = 18; %number of images to plot
fc = ellipsoid_plot(length_y,sigmaf,rho,fc,numpics);

%% make gif of ellipsoid plot
%doesn't work! finish writing
%ellipsoid_gif(length_y)

%% Hamiltonian
%calculate and graph potential, kinetic, and total energy
fc = energy_calc(length_y,t, Mf, sigmaf, fc,rho,G);
