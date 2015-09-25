
col_filter=textread('col_filter.txt','%f');
row_filter=textread('row_filter.txt','%f');
[r c]=size(col_filter);
len=r*c;
col_filter=reshape(col_filter,1,len);
row_filter=reshape(row_filter,1,len);

ww=-pi:pi/100:pi;

HHrow=freqz(row_filter,1,ww);
HHcol=freqz(col_filter,1,ww);

plot(ww,unwrap(angle(HHrow)));
figure
plot(ww,abs(HHrow));
figure
plot(ww,unwrap(angle(HHcol)));
figure
plot(ww,abs(HHcol));