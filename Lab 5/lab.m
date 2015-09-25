% ECE 2026 L10 Lab05 
% Natchaphon Ruengsakulrach & Richard Duan

fsamp = 22050; % sampling frequency (given in the lab)

keys = [-48 -36 -24 -12 0 12 24 36 48]; %keynote numbers for the 9 octaves, 0 is the middle

% create octave keynote numbers for C,D,E,F,G,A,B
C_keynum = 40*ones(1,9) + keys; 
D_keynum = 42*ones(1,9) + keys;
E_keynum = 44*ones(1,9) + keys;
F_keynum = 45*ones(1,9) + keys;
G_keynum = 47*ones(1,9) + keys;
A_keynum = 49*ones(1,9) + keys;
B_keynum = 51*ones(1,9) + keys;
% initialize sum of sinusoid for C,D,E,F,G,A,B (will be updated in the
% loop)
sum_c = 0;
sum_d = 0;
sum_e = 0;
sum_f = 0;
sum_g = 0;
sum_a = 0;
sum_b = 0;

fc = 440; % center frequency (were asked to enter any value btw 260 and 500
sigma = 70000000000000000000000; % sigma value that creates illusion

for i = 1:9
    
    c{i} = key2note(gauss_weight(fc, sigma,C_keynum(i)),C_keynum(i),0.25,fsamp);
    sum_c = sum_c + c{i};
         
    d{i} = key2note(gauss_weight(fc, sigma,D_keynum(i)),D_keynum(i),0.25,fsamp);
    sum_d = sum_d + d{i};
    
    e{i} = key2note(gauss_weight(fc, sigma,E_keynum(i)),E_keynum(i),0.25,fsamp);
    sum_e = sum_e + e{i};
    
    f{i} = key2note(gauss_weight(fc, sigma,F_keynum(i)),F_keynum(i),0.25,fsamp);
    sum_f = sum_f + f{i};
    
    g{i} = key2note(gauss_weight(fc, sigma,G_keynum(i)),G_keynum(i),0.25,fsamp);
    sum_g = sum_g + g{i};
    
    a{i} = key2note(gauss_weight(fc, sigma,A_keynum(i)),A_keynum(i),0.25,fsamp);
    sum_a = sum_a + a{i};
    
    b{i} = key2note(gauss_weight(fc, sigma,B_keynum(i)),B_keynum(i),0.25,fsamp);
    sum_b = sum_b + b{i};
        
end
figure(1)
gauss_weight2(fc, 2,27.5,7040);

z = zeros(1,fsamp*0.25); % create sample of 0 frequencies for a pause between each note
sum_key_p = [ sum_c z sum_d z sum_e z sum_f z sum_g z sum_a z sum_b z]; % with pause
sum_key = [sum_c sum_d sum_e sum_f sum_g sum_a sum_b]; %without pause

sound = repmat(sum_key_p,1,5); %play it 5 times by concatenating sum_key_p 
spec_sound = repmat(sum_key,1,5); %for spectogram

sound_complete = [sound zeros(size(sum_c))] + [zeros(size(sound)) sum_c]; %add C to the sound
figure(2)
spectrogram(spec_sound,512,384,1024,fsamp,'yaxis')

soundsc(sound_complete,fsamp);
soundsc([sum_key sum_key sum_key sum_key sum_key sum_c],fsamp)

