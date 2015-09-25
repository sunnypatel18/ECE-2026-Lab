ssa1 = mkvepo([2,1,0.8],[730,1090,2440],[0.1*pi, -0.3*pi, 0.2*pi],[4000,2000,8000],[1000,800,1200],8000,0.015);
sse1 = mkvepo([2,1,0.8],[530,1840,2480],[0.1*pi, -0.3*pi, 0.2*pi],[4000,2000,8000],[1000,800,1200],8000,0.015);
ssi1 = mkvepo([2,1,0.8],[270,2290,3010],[0.1*pi, -0.3*pi, 0.2*pi],[4000,2000,8000],[1000,800,1200],8000,0.015);
sso1 = mkvepo([2,1,0.8],[570,840,2410],[0.1*pi, -0.3*pi, 0.2*pi],[4000,2000,8000],[1000,800,1200],8000,0.015);
ssu1 = mkvepo([2,1,0.8],[300,870,2240],[0.1*pi, -0.3*pi, 0.2*pi],[4000,2000,8000],[1000,800,1200],8000,0.015);

dur =2;
len=length(ssa1);
overlap=len-96;
v1=ssa1(1:96);
v=ssa1(97:len)+ssa1(1:overlap);
vv=[v,ssa1(overlap+1:overlap + 96)];
ssa=[];
for k=1:ceil(dur*f0)
    ssa=[ssa,vv];
end

dur =2;
len=length(sse1);
overlap=len-96;
v1=sse1(1:96);
v=sse1(97:len)+sse1(1:overlap);
vv=[v,sse1(overlap+1:overlap + 96)];
sse=[];
for k=1:ceil(dur*f0)
    sse=[sse,vv];
end

dur =2;
len=length(ssi1);
overlap=len-96;
v1=ssi1(1:96);
v=ssi1(97:len)+ssi1(1:overlap);
vv=[v,ssi1(overlap+1:overlap + 96)];
ssi=[];
for k=1:ceil(dur*f0)
    ssi=[ssi,vv];
end

dur =2;
len=length(sso1);
overlap=len-96;
v1=sso1(1:96);
v=sso1(97:len)+sso1(1:overlap);
vv=[v,sso1(overlap+1:overlap + 96)];
sso=[];
for k=1:ceil(dur*f0)
    sso=[sso,vv];
end

dur =2;
len=length(ssu1);
overlap=len-96;
v1=ssu1(1:96);
v=ssu1(97:len)+ssu1(1:overlap);
vv=[v,ssu1(overlap+1:overlap + 96)];
ssu=[];
for k=1:ceil(dur*f0)
    ssu=[ssu,vv];
end

soundsc([ssa sse ssi sso ssu]);
