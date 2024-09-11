% Load audio file
[X, Fs] = audioread('D:\8th Semester\EE599 - Audio Engineering\MATLAB codes\Queen  Bohemian Rhapsody (Official Video Remastered).mp3');
 
% Extract a segment of the signal X = X(Fs*15:Fs*20,1);
 
% Parameters
N = length(X); % length of the segment
frame_length = N; % using the whole segment as one frame 
zero_order = 10; % LPC order
pole_order = zero_order; % typically same as zero_order
 
% Apply windowing
w = hann(frame_length); signal = X .* w;
% LPC Analysis using built-in MATLAB function 
[coeff, ~] = lpc(signal, zero_order);
 
% Extract LPC coefficients
A = coeff; % LPC coefficients
B = [1];    % Numerator coefficients for LPC (typically just 1)
% Create the transfer function
sys = tf(B, A, 1/Fs); % Specify the sample time (1/Fs) for discrete-time
 
% Display poles and zeros 
P = pole(sys);
Z = zero(sys);
 
% Plot the pole-zero map figure;
pzmap(sys);
title('Pole-Zero Plot in Z-Domain'); grid on;
 
% Frequency response figure;
freqz(signal, 1, 1024, Fs); title('Frequency Response');
