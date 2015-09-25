
col_filter=textread('col_filter.txt','%f');
row_filter=textread('row_filter.txt','%f');
[r c]=size(col_filter);
len=r*c;
col_filter=reshape(col_filter,1,len);
row_filter=reshape(row_filter,1,len);

ww=-pi:pi/100:pi;

HHrow=freqz(row_filter,1,ww);
HHcol=freqz(col_filter,1,ww);


figure
plot(ww,unwrap(angle(HHrow)));
hold on;
plot(ww,unwrap(angle(HHcol)));
hold off;

figure
plot(ww,abs(HHrow));
hold on;
stem(2*pi.*[.3,.325,.35,.375,.4], [1,1,1,1,1],'r*');
plot(ww,abs(HHcol));
hold off;

