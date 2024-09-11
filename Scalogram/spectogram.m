% Read the stereo audio file
[audioSignal, Fs] = audioread("D:\Downloads\sarigamapa.wav"); % Fs is the sampling frequency

% Check if the audio is stereo, and convert it to mono by averaging the two channels
if size(audioSignal, 2) == 2
audioSignal = mean(audioSignal, 2); % Take the mean of both channels to get a mono signal
end

% Define parameters for the spectrogram windowSize = 256;	% Window size for STFT
overlap = windowSize / 2; % Overlap between windows nfft = 512;	% Number of FFT points

% Compute and plot the power spectrogram figure;
spectrogram(audioSignal, hamming(windowSize), overlap, nfft, Fs, 'yaxis');
