G1 = tf([300],[250 35 1])
zz = tf([1],[1 0],15)
Gz = c2d(G,15,'zoh')
Gzz = Gz*zz
%kp= 0.00035
%ki = 0.0007
%kd = 0.002
%Gc = tf([kp+ki+kd 2*ki-2*kd ki+kd-kp],[1 0 -1],15)
%Gc = tf([1 -1],[1 1],15)
Gcw=d2c(Gc,'Tustin')
G2 = tf([300],[250 35 1],'ioDelay', 15)
G2z = c2d(H,15,'zoh')
Gw=d2c(Gzz,'Tustin')
Gw2=d2c(G2z,'Tustin')
gzpk = zpk([],[-1/10 -1/25],30/25,'InputDelay', 15)
gzzpk = c2d(gzpk,15,'zoh')
Gw3=d2c(gzzpk,'Tustin')
margin(Gw*Gcw)
%c = db2mag(-45.1)
d = 10^(-(48+6.5)/20)
%margin(c*Gw)
syms v
%eq = (sqrt((-2.434*v^2 + 0.1316)^2 + (-18.63*v^3 - 1.642*v)^2))/(sqrt((-0.2569*v^2 + 0.0004386)^2 + (-1*v^3 + 0.01976*v)^2)) == 1/0.0056
%resp = solve(eq,v)
%margin(tf(bilin(ss(Gzz), -1, 'S_Tust', [15 1])))
%g = tf([0.07],[1 0.87 0])
%gz = c2d(g,1,'zoh')
%roots([1 -1.419 0.419])
%gzpk = zpk([],[0 -0.87],0.07)
%gzz = c2d(gzpk,1,'zoh')

%H = tf([8],[8 -1])
%Hd = c2d(H,1,'zoh')
%syms t
%P = [t t;0.125*t 0]
%e = P*[1 0;0 exp(-0.125*t)]*inv(P)
%H = tf([8],[8 -1],'InputDelay', 1)
%DelayT = struct('delay',1,'a',[0 0;0 0],'b',[0;1],'c',0,'d',0);
%sys = delayss([-0.125 1;0 0],[0;0],[1 0],[0],DelayT)
