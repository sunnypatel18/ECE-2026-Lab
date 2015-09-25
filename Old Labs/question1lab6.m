tt = 0:1/8000:1;
xx = -3000.*pi.*(sin(2.*pi.*tt)-1);
plot(tt,xx);

A = find(xx<20);

B = length(A);

C = B/8000;