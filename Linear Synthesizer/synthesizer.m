Fs = 44100;
r = 0.9999;
f0 = 220;
k = 3; % frequency of note A
f = f0*2^(k/12); % Relative key of Middle C
th = f*pi/(Fs/2);
% Filter Coefficients
b = 1;
a = [1 -2*r*cos(th) r^2];
% Plot curves
x = zeros(Fs*2, 1);
x(1) = 1;
y = filter(b, a, x);
plot(y);