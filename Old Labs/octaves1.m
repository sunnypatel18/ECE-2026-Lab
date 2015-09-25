
function zz = octaves1(fc,o,dur,fs)
dbstop if error
zz = [];

            for i = 0:6
                x1 = key2note(gaussian(fc,o,440*2^((1+i-49)/12)),1+i,dur,fs);
                x2 = key2note(gaussian(fc,o,440*2^((13+i-49)/12)),13+i,dur,fs); 
                x3 = key2note(gaussian(fc,o,440*2^((25+i-49)/12)),25+i,dur,fs); 
                x4 = key2note(gaussian(fc,o,440*2^((37+i-49)/12)),37+i,dur,fs); 
                x5 = key2note(gaussian(fc,o,440*2^((49+i-49)/12)),49+i,dur,fs); % middle C is 440
                x6 = key2note(gaussian(fc,o,440*2^((61+i-49)/12)),61+i,dur,fs); 
                x7 = key2note(gaussian(fc,o,440*2^((73+i-49)/12)),73+i,dur,fs);
                x8 = key2note(gaussian(fc,o,440*2^((85+i-49)/12)),85+i,dur,fs);
                x9 = key2note(gaussian(fc,o,440*2^((97+i-49)/12)),97+i,dur,fs);
                yy = [ x1 , x2 , x3 , x4 , x5 , x6 , x7 , x8 , x9 ];
                zz(i:12+i:108) = yy;
                %zz = [yy, x1 , x2 , x3 , x4 , x5 , x6 , x7 , x8 , x9 ];
              
            end
       
%plot(log2(zz));

%spectrogram(zz,512,384,512,fs,'yaxis')

  soundsc(zz,22050)

end