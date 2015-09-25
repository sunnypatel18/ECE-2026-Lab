scale.keys = [-48 -36 -24 -12 0 12 24 36 48];
scale.durations = 0.25 * ones(1,length(scale.keys));
fs = 11025*2;

ii  = 0;
kk = 0;
fc = 440;
sigma = 1000;
tone = cell(1,12); 
for ii = 0:6
    for kk = 1:length(scale.keys)
        keynum = scale.keys(kk);
        nn = ii+1;
        tone{1,nn} = [key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 48 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 36 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 24 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum - 12 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + ii, 0.25, fs) + key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 12 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 24 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 36 + ii, 0.25, fs)+ key2note(exp(-1.*((log2(keynum)-log2(fc)).^2)/(2.*(sigma).^2)),keynum + 48 + ii, 0.25, fs)];
        
    end
end

%concatenate each note with the cell contents:
sound = [tone{1,1} tone{1,2} tone{1,3} tone{1,4} tone{1,5} tone{1,6} tone{1,7} tone{1,8} tone{1,9} tone{1,10} tone{1,11} tone{1,12}]; 
%repeat five times (no pause):
soundFinal = repmat(sound,1,5);
%repeat each sound
soundsc(soundFinal,fs);

%for graph of gaussian
figure(1) 
gauss_weight2(fc, 2,27.5,7040); %calls gauss_weight2, see below for function