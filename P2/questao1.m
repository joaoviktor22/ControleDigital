G1 = tf([300],[250 35 1])
zz = tf([1],[1 0],15)
Gz = c2d(G,15,'zoh')
Gzz = Gz*zz
Gw=d2c(Gzz,'Tustin')
bode(Gw)
c = db2mag(-45.1)
margin(c*Gw)