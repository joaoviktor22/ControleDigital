%g = tf([0.0151*68.9272 0.0151],[0.2449 1 0 0])
g = tf([1],[1 1 0])
Gz = c2d(g,0.2)
%margin(g)
%margin(Gz)
gw=d2c(Gz,'Tustin')
kc = 2%calculado antes
gww = gw*kc
margin(gww)
syms a;
a = (1 - sind(28))/(1+sind(28))
c = mag2db(sqrt(a))
w = 1.7
T = 1/(sqrt(a)*w)
%kc = sqrt(1 + (a*T)^2)/sqrt(1 + T^2) %calculado depois
g2 = tf([kc*T kc],[a*T 1])
margin(series(g2,gw))

