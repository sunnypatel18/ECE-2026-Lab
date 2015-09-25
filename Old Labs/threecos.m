function xcos=threecos(amps, freqs,phs, fs, dur)
% dur = 2;
% fs = 8000;
% f0 = 160;   % fundamental frequency (samples/second)
% T0 = 1/f0; % fundamental period (seconds/sample)
% N0 = T0 * fs;  % fundamental period. 


tt=0:1/fs:dur;

len=length(amps);
for i=1:len
    xcos(:,i)=amps(i).*real(exp(j*2*pi.*freqs(i).*tt).*exp(j*phs(i)));
end
 
%xcos=threecos([2, 1, 0.8],[320,800,2400],[0.1*pi, -0.3*pi, 0.2*pi],8000,2);
xx=xcos(:,1)+xcos(:,2)+xcos(:,3);

tt = 0:1/fs:T0*4;
plot (tt, xx)


wlen = length(xx);
novlp = wlen / 2;
win = ones (wlen, 1);


nfft = length(xx);

figure
spectrogram (xx, win, novlp, nfft, fs, 'yaxis');



end
