[xx,fs,fint]=ECGmake10('spatel354',15);

w=2*pi*fint/fs;

zero=exp(j*w);
pole=0.95*exp(j*w);


num=[1,-.1807,1];
den=[1,-.1717,0.9025];

yy=filter(num,den,xx);


% subplot(2,1,1);
% tt=0:1/fs:(15-(1/fs));
% plot(tt,xx);
% subplot(2,1,2);
% plot(tt,yy);
 subplot(2,1,1);
 spectrogram(xx,256,128,256,4000,'yaxis');
 subplot(2,1,2);
 spectrogram(yy,256,128,256,4000,'yaxis');