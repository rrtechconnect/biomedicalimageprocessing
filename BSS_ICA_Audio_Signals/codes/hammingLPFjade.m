close all;
clear all;
M=2;
[s1,Fs(1),bits(1)]=WAVREAD('source4.WAV');
[s2,Fs(2),bits(2)]=WAVREAD('source2.WAV');
s1=s1';
s2=s2';
maxlength=max(length(s2),length(s1));
s(1,:)=[s1 zeros(1,maxlength-length(s1))];
s(2,:)=[s2 zeros(1,maxlength-length(s2))];
figure;
subplot(4,1,1);plot(s(1,:));
title('original first sound signal');
wavwrite(s(1,:),'b1.wav');
subplot(4,1,2);plot(s(2,:));
title('original second sound signal');
wavwrite(s(2,:),'b2.wav');
n(1,:)=.01*randn(size(s(1,:)));
wavwrite(n(1,:),'noise.wav');
subplot(4,1,3);plot(n(1,:));
title('noisy signal ');
y(1,:)=s(1,:)+n(1,:);
subplot(4,1,4);plot(y(1,:));
title('original sound signal one with noise');
wavwrite(y(1,:),'bn1.wav');
y(2,:)=s(2,:)+n(1,:);
figure;
subplot(4,1,1);plot(y(2,:));
title('original sound signal two with noise');
wavwrite(y(2,:),'bn2.wav');
a11=.65; ; a12=-.9;
a21=1.2; a22=.7;
A=[[a11 a12];[a21 a22]];
x=A*y;
mixes=x;
subplot(4,1,2);plot(x(1,:));
title('mixed sound signal one');
wavwrite(x(1,:),'bm1.wav');
subplot(4,1,3);plot(x(2,:));
title('mixed sound  signal two');
wavwrite(x(1,:),'bm2.wav');
B=jadeR(x);
v=B*x;
subplot(4,1,4);plot(v(1,:));
title('separated signal one');
wavwrite(v(1,:),'bs1.wav');
figure;
subplot(4,1,1);plot(v(2,:));
title('separated signal two');
wavwrite(v(2,:),'bs2.wav');
rp=0.02; rs=0.01;
fp=500; fs=800; Fs=8000;
wp=2*fp/Fs; ws=2*fs/Fs;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/Fs;
n=ceil(num/dem);
n1=n+1;
if(rem(n,2)~=0)
    n1=n;
    n=n-1;
end
y=hamming(n1);
b=fir1(n,wp,y);
z(1,:)=filter(b,1,v(1,:));
subplot(4,1,2);plot(z(1,:));
title('filterd signal1');
wavwrite(z(1,:),'bik333.wav');
rp=0.02; rs=0.01;
fp=500; fs=800; Fs=8000;
wp=2*fp/Fs; ws=2*fs/Fs;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/Fs;
n=ceil(num/dem);
n1=n+1;
if(rem(n,2)~=0)
    n1=n;
    n=n-1;
end
y=hamming(n1);
b=fir1(n,wp,y);
z(2,:)=filter(b,1,v(2,:));
subplot(4,1,3);plot(z(2,:));
title('filterd signal2');
wavwrite(z(2,:),'bik444.wav');