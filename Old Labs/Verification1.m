%--- make a plot of a weird signal

N = 180;
for k=1:N
xk(k) = k/60;
rk(k) = sqrt( xk(k)*xk(k) - 0.5 )+ 0.25;
sig(k) = exp(j*2*pi*rk(k));
end
plot( xk, real(sig), 'mo-', xk, imag(sig), 'go-' )


%rewritten without the for loop

N = 180;
k=1:N;
xk(k) = k/60;
rk(k) = sqrt( xk(k).*xk(k) - 0.5 )+ 0.25;
sig(k) = exp(j*2*pi*rk(k));
plot( xk, real(sig), 'mo-', xk, imag(sig), 'go-' )