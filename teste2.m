clear all; close all; clc
Ts=pi/40;
fs=1/Ts;
w1=20;
DigFreq1 = w1;
w2=30;
DigFreq2 = w2;
w3=70;
DigFreq3 = w3;
N=1000;
n = 0:1:N-1;
t_sample = [0 : Ts: (N-1)*Ts];
x=2*sin(DigFreq1*n)+sin(DigFreq2*n)+(1/2);
figure;
plot(t_sample,x)
set(gca,'FontSize',16)
set(gca,'FontSize',16)
xlabel('$t$','Interpreter','LaTex','FontSize',18)
ylabel('$x(t)$','Interpreter','LaTex','FontSize',18)
X=fft(x);
figure;
X_mag=abs(X);
X_mag(30:34)
plot(X_mag)
set(gca,'FontSize',16)
figure;
n = 0:1:(N-1);
plot((fs/N).*n,X_mag/(N/2))
xlim([0 fs/2])
set(gca,'FontSize',16)
xlabel('$f(Hz)$','Interpreter','LaTex','FontSize',18)
ylabel('$|X(\omega)|$','Interpreter','LaTex','FontSize',18)