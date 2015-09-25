function [xx, times] = signal(tend)
times = tend(1):1/100:tend(2);
xx = [];
for ii=1:length(times)
   xx = [xx, cos(2*pi*times(ii))];
end;