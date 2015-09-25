function Mout = mxpd( A, irup, icup, outname) 
% expand matrix 
% irup = row expansion factor 
% icup = column expansion factor 

% x1 = downsample('silo.png', 'silodown2.png', 2);
% x2 = downsample('silo.png', 'silodown3.png', 3);
% x3 = downsample('silo.png', 'silodown4.png', 4);

[m n] = size(A); 
vr = ceil((1:m*irup)/irup); 
vc = ceil((1:n*icup)/icup); 
Mout = A(vr,vc); 
imwrite(Mout,outname);
end 

% y1 = mxpd(x1,2,2,'siloup2.png');
% y2 = mxpd(x2,3,3,'siloup3.png');
% y3 = mxpd(x3,4,4,'siloup4.png');