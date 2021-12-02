%Compensador avanco
%g1 = tf([0.5],[1 0.5])
%g2 = tf([0.25],[1 2.5])
%g = 3*g1*g2
%g = tf([1],[1 1 0])
%kc = (1 - 0.02)/(0.02*(0.2493/0.831))
%a = 1/10^(-24.4/20)
%b = (0.1*1.34)/(33.5*24.4)
%Gz = c2d(g,1)
G = tf([300],[250 35 1])
zz = tf([1],[1 0],15)
roots([250 35 1])
Gz = c2d(G,15,'zoh')
Gzz = Gz*zz
%margin(g)
%margin(Gz)
gw=d2c(Gzz,'Tustin')
%kc = 2%calculado antes
margin(gw)
%a = (1 - sind(290))/(1+sind(290))%
c = mag2db(sqrt(a))
w = 6.4
%T = 1/(sqrt(a)*w)
T = 1/0.134
%kc = sqrt(1 + (a*T)^2)/sqrt(1 + T^2) %calculado depois
g2 = tf([kc*T kc],[a*T 1])
%margin(series(g2,gw))

%COMPENSADOR EM ATRASO
%OLHA FREQUENCIA DE ONDE ESTA A FASE QUE TU QUER
%OLHA O GANHO NESSA FREQUENCIA
%alfa = 1/10^(-ganho/20)
%Pega a FREQUENCIA,divide por 10 e faz 1/frequencianova para achar T
%T = 1/0.134