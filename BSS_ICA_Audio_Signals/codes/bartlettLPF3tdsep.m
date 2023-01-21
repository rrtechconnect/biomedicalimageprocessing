close all;
clear all;
M=3;
[s1,Fs(1),bits(1)]=WAVREAD('source4.WAV');
[s2,Fs(2),bits(2)]=WAVREAD('source2.WAV');
[s3,Fs(3),bits(3)]=WAVREAD('source3.WAV');
s1=s1';
s2=s2';
s3=s3';
maxlength=max(length(s3),length(s2));
maxlength1=max(maxlength,length(s1));
s(1,:)=[s1 zeros(1,maxlength-length(s1))];
s(2,:)=[s2 zeros(1,maxlength-length(s2))];
s(3,:)=[s3 zeros(1,maxlength1-length(s3))];
figure;
subplot(4,1,1);plot(s(1,:));
title('original first sound signal');
wavwrite(s(1,:),'b1.wav');
subplot(4,1,2);plot(s(2,:));
title('original second sound signal');
wavwrite(s(2,:),'b2.wav');
subplot(4,1,3);plot(s(3,:));
title('original third sound signal');
wavwrite(s(3,:),'b3.wav');
n(1,:)=.01*randn(size(s(1,:)));
wavwrite(n(1,:),'noise.wav');
subplot(4,1,4);plot(n(1,:));
title('noisy signal ');
y(1,:)=s(1,:)+n(1,:);
figure;
subplot(3,1,1);plot(y(1,:));
title('original sound signal one with noise');
wavwrite(y(1,:),'bn1.wav');
y(2,:)=s(2,:)+n(1,:);
subplot(3,1,2);plot(y(2,:));
title('original sound signal two with noise');
wavwrite(y(2,:),'bn2.wav');
y(3,:)=s(3,:)+n(1,:);
subplot(3,1,3);plot(y(3,:));
title('original sound signal three with noise');
wavwrite(y(3,:),'bn3.wav');
a11=0.9217;  a12=0.4872; a13=0.1171;
a21=0.6125; a22=0.1252; a23=0.9137;
a31=0.3298; a32=0.5787; a33=0.7837;
A=[[a11 a12 a13];[a21 a22 a23];[a31 a32 a33]];
x=A*y;
mixes=x;
figure;
subplot(3,1,1);plot(x(1,:));
title('mixed sound signal one');
wavwrite(x(1,:),'bm1.wav');
subplot(3,1,2);plot(x(2,:));
title('mixed sound  signal two');
wavwrite(x(2,:),'bm2.wav');
subplot(3,1,3);plot(x(3,:));
title('mixed sound  signal three');
wavwrite(x(3,:),'bm3.wav');
[C,D]=tdsep2(x,4);
v=inv(C)*x;
figure;
subplot(3,1,1);plot(v(1,:));
title('separated signal one');
wavwrite(v(1,:),'bs1.wav');
subplot(3,1,2);plot(v(2,:));
title('separated signal two');
wavwrite(v(2,:),'bs2.wav');
subplot(3,1,3);plot(v(3,:));
title('separated signal three');
wavwrite(v(3,:),'bs3.wav');
rp=0.04; rs=0.02;
fp=1500; fs=2000; Fs=8000;
wp=2*fp/Fs; ws=2*fs/Fs;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/Fs;
n=ceil(num/dem);
n1=n+1;
if(rem(n,2)~=0)
    n1=n;
    n=n-1;
end
y=bartlett(n1);
b=fir1(n,wp,y);
z(1,:)=filter(b,1,v(1,:));
figure;
subplot(3,1,1);plot(z(1,:));
title('filterd signal1');
wavwrite(z(1,:),'bik333.wav');
rp=0.04; rs=0.02;
fp=1500; fs=2000; Fs=8000;
wp=2*fp/Fs; ws=2*fs/Fs;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/Fs;
n=ceil(num/dem);
n1=n+1;
if(rem(n,2)~=0)
    n1=n;
    n=n-1;
end
y=bartlett(n1);
b=fir1(n,wp,y);
z(2,:)=filter(b,1,v(2,:));
subplot(3,1,2);plot(z(2,:));
title('filterd signal2');
wavwrite(z(2,:),'bik444.wav');
rp=0.04; rs=0.02;
fp=1500; fs=2000; Fs=8000;
wp=2*fp/Fs; ws=2*fs/Fs;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/Fs;
n=ceil(num/dem);
n1=n+1;
if(rem(n,2)~=0)
    n1=n;
    n=n-1;
end
y=bartlett(n1);
b=fir1(n,wp,y);
z(3,:)=filter(b,1,v(3,:));
subplot(3,1,3);plot(z(3,:));
title('filterd signal3');
wavwrite(z(3,:),'bik555.wav');