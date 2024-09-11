% Read the stereo audio file
[audioSignal, Fs] = audioread("D:\Downloads\sarigamapa.wav"); % Fs is the sampling frequency

% Check if the audio is stereo, and convert it to mono by averaging the two channels
if size(audioSignal, 2) == 2
audioSignal = mean(audioSignal, 2); % Take the mean of both channels to get a mono signal
end

% Define STFT parameters
windowSize = 256;	% Size of the window for STFT overlap = windowSize / 2; % Overlap between windows
 
nfft = 512;	% Number of FFT points

% Compute the STFT of the audio signal
[stftResult, freq, time] = stft(audioSignal, Fs, 'Window', hamming(windowSize), 'OverlapLength', overlap, 'FFTLength', nfft);

% Compute the scalogram (squared magnitude of STFT result) scalogram = abs(stftResult).^2;
