wn=0.116;
zeta=0.4309;
np=[wn^2];
dp=[1 2*zeta*wn wn^2];
sys=tf(np,dp)
t=0:0.01:200;
y=step(sys,t);
plot(t,y)
xlabel('Tempo com sample time de 1.5')
ylabel('Saída')
legend('Saída tempo contínuo')
hold on
grid on

kc = (((pi^2)/(30^2))+0.05^2)/15
e = exp(-0.15)
G_c_frente = tf([kc*1.5],[1 -1],1.5)
G_c_tras = tf([kc*1.5 0],[1 -1],1.5)
syms s z
G_ghz= tf([15],[1 0.1]);
G_ghz_d = c2d(G_ghz,1.5)
g1 = G_ghz_d*G_c_frente
g1f = feedback(g1,1)
step(g1f)
xlabel('Tempo com sample time de 1.5')
ylabel('Saída')
legend('Saída com retangular para frente')
hold on
grid on
g2 = G_ghz_d*G_c_tras
g2f = feedback(g2,1)
step(g2f)
xlabel('Tempo com sample time de 1.5')
ylabel('Saída')
legend('Saída com retangular para tras')
hold on
grid on