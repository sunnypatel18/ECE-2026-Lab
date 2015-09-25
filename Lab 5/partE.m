%Part 4.1e

fsamp = 22050; % sampling frequency
keys = [-48 -36 -24 -12 0 12 24 36 48]; %keynote numbers to use in key2num function. There are 9 octaves, 0 is the middle (reference) octive.

% create octave keynote numbers for C,D,E,F,G,A,B
C_keynum = 40*ones(1,9) + keys;
Cs_keynum = 41*ones(1,9) + keys; 
D_keynum = 42*ones(1,9) + keys; 
Ds_keynum = 43*ones(1,9) + keys; 
E_keynum = 44*ones(1,9) + keys;
F_keynum = 45*ones(1,9) + keys;
Fs_keynum = 46*ones(1,9) + keys; 
G_keynum = 47*ones(1,9) + keys;
Gs_keynum = 48*ones(1,9) + keys; 
A_keynum = 49*ones(1,9) + keys;
As_keynum = 50*ones(1,9) + keys;
B_keynum = 51*ones(1,9) + keys;

% initialize vars that will store each note of C,D,E,F,G,A,B 
 sum_c = 0; sum_cs = 0; sum_d = 0; sum_ds = 0; sum_e = 0; sum_f = 0; sum_fs = 0; sum_g = 0; sum_gs = 0; sum_a = 0; sum_as = 0; sum_b = 0;
 
fc = 440; % center frequency (were asked to enter any value btw 260 and 500
sigma = 10; % choose a larger value of sigma to smoothen the graph
dura = 0.2 

for i = 1:9  
    c{i} = key2note(gauss_weight(fc, sigma,C_keynum(i)),C_keynum(i),dura,fsamp);
    sum_c = sum_c + c{i};
       
    cs{i} = key2note(gauss_weight(fc, sigma,Cs_keynum(i)),Cs_keynum(i),dura,fsamp);
    sum_cs = sum_cs + cs{i};
    
    d{i} = key2note(gauss_weight(fc, sigma,D_keynum(i)),D_keynum(i),dura,fsamp);
    sum_d = sum_d + d{i};
    
    ds{i} = key2note(gauss_weight(fc, sigma,Ds_keynum(i)),Ds_keynum(i),dura,fsamp);
    sum_ds = sum_ds + ds{i};
    
    e{i} = key2note(gauss_weight(fc, sigma,E_keynum(i)),E_keynum(i),dura,fsamp);
    sum_e = sum_e + e{i};
    
    f{i} = key2note(gauss_weight(fc, sigma,F_keynum(i)),F_keynum(i),dura,fsamp);
    sum_f = sum_f + f{i};
    
    fs{i} = key2note(gauss_weight(fc, sigma,Fs_keynum(i)),Fs_keynum(i),dura,fsamp);
    sum_fs = sum_fs + fs{i};
    
    g{i} = key2note(gauss_weight(fc, sigma,G_keynum(i)),G_keynum(i),dura,fsamp);
    sum_g = sum_g + g{i};
    
    gs{i} = key2note(gauss_weight(fc, sigma,Gs_keynum(i)),Gs_keynum(i),dura,fsamp);
    sum_gs = sum_gs + gs{i};
    
    a{i} = key2note(gauss_weight(fc, sigma,A_keynum(i)),A_keynum(i),dura,fsamp);
    sum_a = sum_a + a{i};
    
    as{i} = key2note(gauss_weight(fc, sigma,As_keynum(i)),As_keynum(i),dura,fsamp);
    sum_as = sum_as + as{i};
    
    b{i} = key2note(gauss_weight(fc, sigma,B_keynum(i)),B_keynum(i),dura,fsamp);
    sum_b = sum_b + b{i};        
end

%figure(1) %creates plot
%gauss_weight2(fc, 2,27.5,7040);

%z = zeros(1,fsamp*0.25); % create sample of 0 frequencies for a pause between each note
%sumWPause = [ sum_c z sum_cs z sum_d z sum_ds z sum_e z sum_f z sum_fs z sum_g z sum_gs z sum_a z  sum_as z sum_b z]; % add up sinusoids with pauses

%soundSpace = repmat(sumWPause,1,5); %concatenate 5 times
%soundsc(soundSpace,fsamp); %play the vector of sinusoids

%Spectrogram
%spec_sound = repmat(sum_key,1,5); %create scale, no space
%spectrogram(spec_sound,512,384,1024,fsamp,'yaxis')

%============================================================================
%no space, play back:
sound = [ sum_c sum_cs sum_d sum_ds sum_e sum_f sum_fs sum_g sum_gs sum_a sum_as sum_b]; % add up sinusoids with pauses

%repeat 5 times
soundRepeat = repmat(sound,1,5);
soundsc(soundRepeat,fsamp);


















