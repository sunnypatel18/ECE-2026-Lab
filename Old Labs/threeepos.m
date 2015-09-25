function epo=threeepos(as,bs,fs,dur)

% epo = threeepos([4000,2000,8000],[1000,800,1200],8000,0.015);
tt=0:1/fs:dur;
len=length(as);

for i=1:len
    epo(:,i)=as(i)*tt.*exp(-bs(i).*tt);
end
%%%%% comment these for 3.3
figure
hold on
    plot(tt,epo(:,1),'-g');
    plot(tt,epo(:,2),'-r');
    plot(tt,epo(:,3),'-b');
    %%%%%%%%%%%
end