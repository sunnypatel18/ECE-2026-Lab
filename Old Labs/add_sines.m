function [xx,tt] = add_sines(freqs, Camps, fs, dur, tstart)

fL = length (freqs);
CL = length (Camps);
    
if   fL == CL
   
    tt = tstart : 1/(fs) : tstart+dur;
    
    xk = [];
    
    for k = 1:fL
        
        xk(k,:) = real(Camps(k) * exp(j*freqs(k)*2*pi*tt));
    
    end
    
    xx = sum(xk);
    
else 
        error('The lengths do not match');
end
  plot(tt,xx,'r-')
end


% [xx0,tt0] = add_sines([40,64,80],[4*exp(j*0.2),2.2*exp(-j*(pi/2)),1.1],164,10,0);
% stem(tt0,xx0), xlim([4,4.5])