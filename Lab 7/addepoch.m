dur = 2;
amps = [2,1,0.8];
freqs = [270,2290,3010];
phs = [0.1*pi, -0.3*pi, 0.2*pi];
as = [4000,2000,8000];
bs = [1000,800,1200];
fs = 8000;
dur1=0.015;
f0=83.333;

vepo=mkvepo(amps, freqs, phs, as, bs, fs, dur1);

len=length(vepo);
overlap=len-96;
v1=vepo(1:96);
v=vepo(97:len)+vepo(1:overlap);
vv=[v,vepo(overlap+1:overlap + 96)];
cc=[];
for k=1:ceil(dur*f0)
    cc=[cc,vv];
end
 %tt0=0:1/8000:2;
 %xx=[v1,cc,v,vepo(26:80)];


spectrogram(cc);
soundsc(cc,8000);
