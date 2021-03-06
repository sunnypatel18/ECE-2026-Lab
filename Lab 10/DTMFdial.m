function xx = DTMFdial(keyNames,fs)
%DTMFDIAL Create a signal vector of tones that will dial
% a DTMF (Touch Tone) telephone system.
%
% usage: xx = DTMFdial(keyNames,fs)
% keyNames = vector of CHARACTERS containing valid key names
% fs = sampling frequency
% xx = signal vector that is the concatenation of DTMF tones.
%
% xx = DTMFdial('404385967210',4000);
% spectrogram(xx,256,128,256,4000,'yaxis');
TT.keys = ['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];
TT.colTones = [1209,1336,1477,1633]; %-- in Hz
TT.rowTones = [697,770,852,941];
%
num_keys = length(keyNames);
%
dur_DualTone = 0.2; %-- in seconds // 200 ms
dur_silence = 0.08; %-- in seconds // 8 ms
%
samples_per_key = fs*(dur_DualTone+dur_silence);
%
%check for invalid keys
%
for ii=1:num_keys
if(sum(find(keyNames(ii) == TT.keys))==0) %Key not found
error('Invalid key name input.');
end
end
%
xx = zeros(1,num_keys*samples_per_key); %- initialize xx to be long enough to hold the entire output
tt = linspace(0,dur_DualTone,fs*dur_DualTone); %generate the time tics
%
for kk=1:length(keyNames)
	[jrow,jcol] = find(keyNames(kk)==TT.keys);%- which key?
% more code to make the dual-tone signals
% precede each dual-tone signal with a short interval of silence
	silence = zeros(1,fs*dur_silence);
	DualTone = cos(2*pi*(TT.colTones(jcol))*tt) + cos(2*pi*(TT.rowTones(jrow))*tt);
	xx((kk-1)*(samples_per_key)+1:kk*(samples_per_key)) = [silence DualTone];
end
end