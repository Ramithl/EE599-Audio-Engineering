clear all
close all
clc

r = 0.5;
f0 = 880;	% Frequency of note A

k = 3;	% Relative keynote of note A 
f = f0*2^(k/12);

% Defining sample frequencies 
Fs = 44100;

th = f*pi/(Fs/2);

% Filter coefficients 
b = 1;
a = [1 -2*r*cos(th) r^2];

%Plot the Z-plane coordinates 
zplane(b, a);
