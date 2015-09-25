scale.keys = [-48 -36 -24 -12 0 12 24 36 48];

ii  = 0;
kk = 0;
tone = cell(1,12); 
for ii = 0:6
    for kk = 1:length(scale.keys)
        nn = ii+1;
        tone{1,nn} = [key2note(2*exp(2*j),49 - 48  , 1, 22050)+ key2note(2*exp(2*j),49 - 36  , 1, 22050)+ key2note(2*exp(2*j),49 - 24  , 1, 22050)+ key2note(2*exp(2*j),49 - 12  , 1, 22050)+ key2note(2*exp(2*j),49  , 1, 22050) + key2note(2*exp(2*j),49 + 12  , 1, 22050)+ key2note(2*exp(2*j),49 + 24 , 1, 22050)+ key2note(2*exp(2*j),49 + 36 , 1, 22050)+ key2note(2*exp(2*j),49 + 48 , 1, 22050)];
        
    end
end
%z is the pause between each note
z = zeros(1,22050*0.25); % create sample of 0 frequencies for a pause between each note

%make one with a pause between each note
soundPause = [tone{1,1} z tone{1,2} z tone{1,3} z tone{1,4} z tone{1,5} z tone{1,6} z tone{1,7} z tone{1,8} z tone{1,9} z tone{1,10} z tone{1,11} z tone{1,12}]; 

%repeat five times (pause):
soundFinalpause = repmat(soundPause,1,5);

%repeat each sound
soundsc(soundFinalpause,22050);

