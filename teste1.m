clear all; close all; clc;
Ts = pi/40
f = 1;
fs = 1/Ts;
tempo = [0:1/(100*f):10/f];
sinal = 2*sin(20*tempo) + sin(30*tempo) + (1/2)*sin(70*tempo);
plot(tempo,sinal)
hold;
N=length(tempo);
n = [0:1:N-1];
t_sample = [0 : Ts : n(N)*Ts];
DigitalFrequency=2*pi*f/fs;
sinal_sample = sin (DigitalFrequency.*n);
plot(t_sample, sinal_sample,'o');
axis([0 10/f -4 4])
set(gca,'FontSize',16)
set(gca,'FontSize',16)
xlabel('$t$','Interpreter','LaTex','FontSize',18)
ylabel('$x[nT_s],x(t)$','Interpreter','LaTex','FontSize',18)