function [xx,tt] = make_chirp( f1, f2, dur, fsamp ) 
%MAKE_CHIRP generate a linear-FM chirp signal 
% 
% usage: xx = make_chirp( f1, f2, dur, fsamp ) 
% 
% f1 = starting frequency 
% f2 = ending frequency 
% dur = total time duration 
% fsamp = sampling frequency 
% this template code does not consider the initial phase, phi 
% 
% xx = (vector of) samples of the chirp signal 
% tt = vector of time instants for t=0 to t=dur 
% 
% [xx, tt] = make_chirp(2200,500,1,10000);
% soundsc(xx,10000);
% spectrogram(xx,512,384,1024,10000,'yaxis');
% fres = 10;
% FF = -10000/2:fres:10000/2;
% spectrogram(xx,512,384,FF,10000,'yaxis');
if( nargin < 4 ) %-- Allow optional input argument 
fsamp = 10000; 
end 
tt = 0:1/(fsamp):dur; 
psi = 2*pi*(f1*tt + ((f2-f1)/2)*tt.*tt); 
xx = real( exp(j*psi) );