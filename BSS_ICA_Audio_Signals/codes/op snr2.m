close all; 
clear all;
clean=wavread('bik333.wav');
noise=wavread('noise.wav');
SNR1=10*log10(sum(clean.^2)./sum(noise.^2));
clean=wavread('bik444.wav');
noise=wavread('noise.wav');
SNR2=10*log10(sum(clean.^2)./sum(noise.^2));
clean=wavread('bik555.wav');
noise=wavread('noise.wav');
SNR3=10*log10(sum(clean.^2)./sum(noise.^2));
SNR=(SNR1+SNR2+SNR3)/3;
disp('SNR=');
disp(SNR);