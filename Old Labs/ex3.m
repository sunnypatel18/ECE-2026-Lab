xpx=DTMFdial('33312219966',4000);
col_filter=textread('col_filter.txt','%f');
row_filter=textread('row_filter.txt','%f');
[r c]=size(col_filter);
len=r*c;

col_filter=col_filter';
row_filter=row_filter';


yy(:,1)=conv(row_filter,xpx);
spectrogram(yy(:,1),256,128,256,4000,'yaxis');
yy(:,2)=conv(col_filter,xpx);
figure
spectrogram(yy(:,2),256,128,256,4000,'yaxis');
