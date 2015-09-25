
function [x,t] = onecos(freq,camp,fs,dur,tstart)

% freq % frequenzy
% camp % complex amplitude
% dur %duration in seconds
% tstart %starting time
% fs % sampling rate
% onecos(25,10,8000,.25,0)
% onecos(400,10,8000,.25,0)
% onecos(1000,10,8000,.25,0)

t = tstart : 1/(fs) : tstart+dur;
x = real(camp * exp(freq*2*pi*j*t));

plot(t,x,'r-'), grid on 
title('TEST PLOT of a SINUSOID')
xlabel('TIME (sec)')

end