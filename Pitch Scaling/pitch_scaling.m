[X,Fs] = audioread("E:\sem 8\audio engineering\sarigamapa.wav");

X = X(:,1);

scale_factor = 1;

bpm = 40;

samples_per_beat = round(60*Fs/bpm);

number_of_beats_per_song = round(length(X)/samples_per_beat);

song_new = [];

w = hann(samples_per_beat+1);

L = length(w);

for i=1:number_of_beats_per_song-2

    window = X(i*samples_per_beat:i*samples_per_beat+samples_per_beat);%.*w;

    Y = fft(window);

    

    P2 = (Y/L);

    P1 = P2(1:L/2+1);

    P1(2:end-1) = 2*P1(2:end-1);

    f = Fs*(0:(L/2))/L;

    

    P1_new = [];

    for i=1:length(P1)

        P1_new = [P1_new; P1(i); zeros(scale_factor,1)];

    end

    P1_new = P1_new(1:length(P1));

    Y_new = [P1_new(2:length(P1));flip(P1_new(2:end))];

    X_new = ifft(Y_new,'symmetric'); 

    song_new = [song_new; X_new];

end