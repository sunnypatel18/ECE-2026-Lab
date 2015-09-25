%function ww = gauss_weight(fc, sigma,f_start,f_end)
function ww = gauss_weight(fc, sigma,ff)
%ff = f_start : 1/12 : f_end;

log_ff = log2(ff);
ww = exp(-1.*(((log_ff)-log2(fc)).^2)/(2.*(sigma).^2)); %amplitude of the keynote

% figure(1)
% plot(ff,ww,'bo-');
% figure(2)
% semilogx(log_ff,ww,'bo-');
end
%ww = gauss_weight(440,1,55,1760);