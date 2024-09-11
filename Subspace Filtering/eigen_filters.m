% Load audio file
[X, Fs] = audioread('D:\8th Semester\EE599 - Audio Engineering\MATLAB codes\sarigamapa.wav');
 
% Extract the first 1000 samples 
X_segment = X(1:1000, 1);
 
% Number of overlapping windows (for buffer) 
N = 10;
 
% Segment into overlapping windows using buffer (N samples overlap) 
xx = buffer(X_segment, N, N - 1);
 
% Compute covariance matrix 
R = cov(xx);
 
% Perform eigenvalue decomposition (get the N largest eigenvectors) 
[V, D] = eigs(R, N);
 
% Extract the 1st, 2nd, and 5th dominant eigenvectors
first_eigenvector = V(:, end);  % 1st eigenvector (largest eigenvalue) 
second_eigenvector = V(:, end-1);   % 2nd eigenvector
fifth_eigenvector = V(:, end-4);    % 5th eigenvector
 
% Subplot 2x3: first row for eigenfilters, second row for spectrograms figure;
 
% 1st Eigenvector Plot 
subplot(2, 3, 1); plot(first_eigenvector, '-');
title('1st Dominant Eigenvector'); xlabel('Sample Index'); ylabel('Amplitude');
grid on;
 
% 2nd Eigenvector Plot 
subplot(2, 3, 2); plot(second_eigenvector, '-');
title('2nd Dominant Eigenvector'); xlabel('Sample Index');
 
ylabel('Amplitude'); grid on;
 
% 5th Eigenvector Plot 
subplot(2, 3, 3); plot(fifth_eigenvector, '-');
title('5th Dominant Eigenvector'); xlabel('Sample Index'); ylabel('Amplitude');
grid on;
 
% Spectrogram for 1st Eigenvector 
subplot(2, 3, 4);
spectrogram(first_eigenvector, 128, 120, 128, Fs, 'yaxis'); title('Spectrogram of 1st Eigenvector');
colorbar;
 
% Spectrogram for 2nd Eigenvector 
subplot(2, 3, 5);
spectrogram(second_eigenvector, 128, 120, 128, Fs, 'yaxis'); title('Spectrogram of 2nd Eigenvector');
colorbar;
 
% Spectrogram for 5th Eigenvector 
subplot(2, 3, 6);
spectrogram(fifth_eigenvector, 128, 120, 128, Fs, 'yaxis'); title('Spectrogram of 5th Eigenvector');
colorbar;

