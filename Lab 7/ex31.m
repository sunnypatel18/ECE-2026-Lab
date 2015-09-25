wlen=200;
win=ones(wlen,1);

novlp=wlen/2;
nfft=512;
spectrogram(xx,win,novlp,nfft,fs,'yaxis');