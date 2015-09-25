function [ecgsig,fs,fint] = ECGmake( gtstring, dur )
%ECGMAKE    create ECG signal plus interference
%
%   ecgsig = vector of signal samples at fs samples/sec
%     fint = frequency of the interfering sinusoid (near 50 or 60 Hz)
% gtstring = gt login ID, e.g., 'gburdell8'
%      dur = duration of the signal (optional); default = 15 secs.
%                  (dur < 0 gives interference-free ECG)

if nargin<2, dur = 15; end
durZ = (dur>0);
dur = abs(dur);

if ~exist('Lab12ECGdata.mat')
    error('The data file Lab12ECGdata.mat must be on the path')
end

if ischar(gtstring)
    code = abs(gtstring)*(2.^(1:length(gtstring))');
    rand('state',code);
else
    error('Enter your GT login ID as a string (in quotes)')
end

if abs(dur)>29.1
    error('Signal cannot be longer than 29 secs.')
end

%%if abs( (dur+1)<1e-4 ), dur = -10; end
if abs(dur)<9
    error('Signal needs to be at least 9 secs. long.')
end

fint_all = [50+(-2:0.1:2), 60+(-2:0.1:2)];
fint_all = fint_all*(1+round(rand));
fs_all =  300:50:1000;

jkl = round(length(fs_all)*rand); jkl = jkl + (jkl<1);
fsnew = fs_all(jkl)

jkl = round(length(fint_all)*rand); jkl = jkl + (jkl<1);
fint = fint_all(jkl)

load Lab12ECGdata.mat
xx = xxjc(:,ceil(1.999999*rand(1)+1e-9));
fsold = fs;
fs = fsnew;
clear xxjc

L = round(fsold*dur);
Ls = round(fsnew*dur);
if exist('resample.m')
    [pp,qq] = rat(fsnew/fsold);
    Lx = min(length(xx),L+10*qq);
    s = resample(xx(1:Lx),pp,qq);
else
    ttold = 0:1/fsold:dur;
    ttnew = 0:1/fsnew:dur;
    s = interp1( ttold, xx(1:length(ttold)), ttnew, 'spline', 'extrap' )';
    Ls = length(s);
    % % % sx = interp1( ttnew, s, ttold, 'spline', 'extrap' )';
    % % % norm(sx-xx(1:length(ttold)))/norm(sx)
    % % % max(sx-xx(1:length(ttold)))
end

ttnew = (1:Ls)/fsnew;
s = s(1:Ls)/max(abs(s));
ecgsig = s + 2*durZ*sin(2*pi*fint*ttnew');

PLOTSon = 0;
if PLOTSon
    figure(111)
    subplot(3,1,1)
    plot((0:L-1)/fsold,xx(1:L)),grid on, axis tight
    subplot(3,1,2)
    plot(ttnew,s(1:Ls)),grid on, axis tight
    subplot(3,1,3)
    plot(ttnew,ecgsig),grid on, axis tight, zoom on, shg
end
