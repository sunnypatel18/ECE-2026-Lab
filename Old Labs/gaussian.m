function ww = gaussian(fc,o,ff) 

ww = exp((-(log2(ff)-log2(fc)).^2)/(2*o^2));

% plot(log2(ff),ww);
% subplot(2,2,2),plot((ff),ww);
% subplot(2,2,3),semilogx(ff,ww);

end