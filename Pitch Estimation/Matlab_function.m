% LAKSARA L.G.R. | E/18/189 | EE599 AUDIO ENGINEERING AND ACOUSTICS

% Specify the path to your audio file
filename = "D:\8th Semester\EE599 - Audio Engineering\MATLAB codes\sample.wav";

% Read the audio file
[y1, Fs] = audioread(filename);
song = y1(:,1);

bpm = 107;

samples_per_beat = round(60*Fs/bpm);

number_of_beats_per_song = round(length(song)/samples_per_beat);

pitch_var = [];

w = hann(samples_per_beat+1);

for i=1:number_of_beats_per_song-2

    window = song(i*samples_per_beat:i*samples_per_beat+samples_per_beat).*w;

    [pxx,f] = pwelch(window,500,300,500,Fs,'power');

    [~,j] =  max(abs(pxx));

    estimated_frequency = f(j);

    pitch_var = [pitch_var estimated_frequency*ones(1,samples_per_beat)] ;   

end

figure(1);
plot(pitch_var, 'LineWidth', 1);
xlabel('Time (s)');
ylabel('Pitch (Hz)');
title('Pitch Estimation using MATLAB built-in function');