clear all
close all
clc

% Initialize parameters
Fs = 44100;
x = zeros(1, 100);
x(1) = 1;
r = 0.999;
f0 = 1000;
y = [0,0,0]; % Initialize y with two elements
% Generate the output using the nonlinear difference equation
w = f0 * pi/3;
y=[0,0,0,0];
for i=1:100
 new = x(i)+2*r*cos(w)*y(end) - cos(w*exp(-0.008)*y(end-2));
 y = [y ,new];
end
% Plot the output
plot(y);