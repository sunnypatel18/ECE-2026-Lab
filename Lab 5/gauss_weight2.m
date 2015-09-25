function ww = gauss_weight2(fc, sigma,f_start,f_end)

ff = f_start : 1/12 : f_end;

log_ff = log2(ff);
ww = exp(-1.*(((log_ff)-log2(fc)).^2)/(2.*(sigma).^2)); %amplitude of the keynote

subplot(1,2,1)
plot(log_ff,ww,'b-');

hold on 

subplot(1,2,2)
semilogx(ff,ww,'r-');
end