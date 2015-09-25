function xcos=threecos(amps, freqs,phs, fs, dur)

tt=0:1/fs:dur;

len=length(amps);
for i=1:len
    xcos(:,i)=amps(i).*real(exp(j*2*pi.*freqs(i).*tt).*exp(j*phs(i)));
end
 
%xcos=threecos([2, 1, 0.8],[320,800,2400],[0.1*pi, -0.3*pi, 0.2*pi],8000,2);
xx=xcos(:,1)+xcos(:,2)+xcos(:,3);

% figure(1)
% f0=160;
% T0=1/f0;
% N0=fs*T0;
% t=tt(1:4*N0);
% x=xx(1:4*N0);
% plot(t,x);
% 
% 
% wlen=200;
% nfft = 512;
% win = ones(wlen,1);
% novlp=wlen/2;



% wlen is the length of the rectangular window 
% you may want to try a few values of wlen, say between 100 (12.5ms) 
% and 400 (50ms), and observe the difference in the results 


% figure(2)
% spectrogram(xx,win,novlp,nfft,fs,'yaxis'); 



% novlp is the amount of overlap between successive data windows 
% nfft is the size of the discrete Fourier Transform


end
