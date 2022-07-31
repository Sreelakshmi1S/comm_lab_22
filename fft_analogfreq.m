clc;
close all;
clear all;
T = 1;
%T = 2;
t = -4*T:0.01*T:4*T;
x=sinc(pi*t/T);
Fs=1;
subplot(3,1,1);
plot(t,x);
title('Sinc function');
[N,X , fvals] = FFTAnalog(x, Fs,'single-sided');
subplot(3,1,2);
plot(fvals,abs(X(1:N/2)));
title('Single-Sided Amplitude Spectrum of x(t)')
xlabel('f (Hz)');
ylabel('|Px)|');
grid on;
[N,X , fvals] = FFTAnalog(x, Fs,'double-sided');
subplot(3,1,3);
plot(fvals,fftshift(abs(X)));
title('Double-Sided Amplitude Spectrum of x(t)');
xlabel('f (Hz)');
ylabel('|Px)|');
grid on;
function [N,X , fvals] = FFTAnalog(x, Fs,type)
L = length(x);
N = 1;
for i=0:100
if L>=2^i
continue
elseif L<2^i
N = 2^i;
break
end
end
X = fft(x,N);
if strcmp(type,'single-sided')
fvals = Fs * (0:(N/2)-1)/N;
else
fvals = Fs * (1/N) * (-1*(N/2):(N/2)-1);
end
end
