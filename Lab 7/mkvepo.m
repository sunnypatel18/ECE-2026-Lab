function vepo = mkvepo(amps, freqs, phs, as, bs, fs, dur)

%   freqs=[270,2290,3010];
%   fs=8000;
%   dur=0.015;
%   phs=[0.1*pi, -0.3*pi, 0.2*pi];
%   as=[4000,2000,8000];
%   bs=[1000,800,1200];


%nformats=length(amps);  % should be 3 here 
xcos=threecos(amps, freqs, phs, fs, dur);
epo=threeepos(as,bs,fs,dur);
epocos=xcos.*epo;
vepo=sum(epocos');
tt=0:1/fs:dur;
plot(tt,vepo);

% vepo = mkvepo([2,1,0.8],[270,2290,3010],[0.1*pi, -0.3*pi, 0.2*pi],[4000,2000,8000],[1000,800,1200],8000,0.015);

end
