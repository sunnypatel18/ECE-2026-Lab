[xx,fs,fint]=ECGmake10('natchaphon3');

w=2*pi*fint/fs;

zero=exp(j*w);
pole=0.95*exp(j*w);


num=[1,0.5286,1.0001];
den=[1,0.5022,0.90246];

yy=filter(num,den,xx);


subplot(2,2,1);
tt=0:1/fs:(15-(1/fs));
plot(tt,xx);
subplot(2,2,2);
plot(tt,yy);
subplot(2,2,3);
spectrogram(xx,256,128,256,4000,'yaxis');
subplot(2,2,4);
spectrogram(yy,256,128,256,4000,'yaxis');