%--- play_scale_octives
%---
scale.keys = [-48 -36 -24 -12 0 12 24 36 48];
%-- NOTES: C D E F G A B C  C E G E C
% key #440 is middle-c
%key2note(10*exp(j*2),keynum + 12, 0.25, fs)+ 
scale.durations = 0.25 * ones(1,length(scale.keys));
fs = 11025*2;
xx = zeros(1,ceil(sum(scale.durations)*fs+length(scale.keys)));

ii  = 0;
kk = 0;
fc = 440;
sigma = 2;
tone = cell(1,12); 
for ii = 0:6
    for kk = 1:length(scale.keys)
        keynum = scale.keys(kk);
        nn = ii+1;
        tone{1,nn} = [key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 48 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 36 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 24 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 12 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + ii, 0.25, fs) + key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 12 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 24 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 36 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 48 + ii, 0.25, fs)];
        
    end
end
%z is the pause between each note
z = zeros(1,fs*0.25); % create sample of 0 frequencies for a pause between each note

%concatenate each note with the cell contents:
sound = [tone{1,1} tone{1,2} tone{1,3} tone{1,4} tone{1,5} tone{1,6} tone{1,7} tone{1,8} tone{1,9} tone{1,10} tone{1,11} tone{1,12}]; 

%make one with a pause between each note
soundPause = [tone{1,1} z tone{1,2} z tone{1,3} z tone{1,4} z tone{1,5} z tone{1,6} z tone{1,7} z tone{1,8} z tone{1,9} z tone{1,10} z tone{1,11} z tone{1,12}]; 

%repeat five times (no pause):
soundFinal = repmat(sound,1,5);

%repeat five times (pause):
soundFinalpause = repmat(soundPause,1,5);

%play the sounds:

%repeat each sound
soundsc(soundFinal,fs);

wavwrite(soundFinal,22050,32,'7notes.wav');

%==========================================================================================
%generate the plots

%for graph of gaussian
figure(1) %creates plot
gauss_weight2(fc, 2,27.5,7040);

%plot spectrogram:
figure(2)
spectrogram(soundFinal,512,384,1024,fs,'yaxis');


%for reference ==>
%tone = [key2note(10*exp(j*2),keynum - 48 + ii, 0.25, fs)+ key2note(10*exp(j*2),keynum - 36 + ii, 0.25, fs)+ key2note(10*exp(j*2),keynum - 24 + ii, 0.25, fs)+ key2note(10*exp(j*2),keynum - 12 + ii, 0.25, fs)+ key2note(10*exp(j*2),keynum + ii, 0.25, fs) + key2note(10*exp(j*2),keynum + 12 + ii, 0.25, fs)+ key2note(10*exp(j*2),keynum + 24 + ii, 0.25, fs)+ key2note(10*exp(j*2),keynum + 36 + ii, 0.25, fs)+ key2note(10*exp(j*2),keynum + 48 + ii, 0.25, fs)];