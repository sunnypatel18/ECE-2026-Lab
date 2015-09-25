function xx = key2note(X,keynum,dur,fsamp)

tt = 0:(1/fsamp):dur;
freq = 440*(2^((keynum - 49)/12));
xx = real(X*exp(j*2*pi*freq*tt));
end
%soundsc(xx, fsamp);
%[xn,tn] = coscos(2,3,20,1)
%whos
%key2note(1,47,0.5,11025);