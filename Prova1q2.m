g = tf([1.25],[1 -0.025])
m1 = c2d((g),10,"zoh")%segurador zero

a = atan(0.2993/(1.284-0.6721))
b = 180 - radtodeg(a)

c = atan(0.2993/(1-0.6721))
d = 180 - radtodeg(c)
resp = b+d
-180+resp
tan(degtorad(68.4539))

G_ghz= tf([15],[1 0.1]);
G_ghz_d = c2d(G_ghz,1.5)
g1 = G_ghz_d*G_c_frente
g1f = feedback(g1,1)
step(g1f)


gcz = zpk([0.7903],[1],0.0662,10)
gz = zpk([],[1.284],14.2,10)
gf = zpk([0.6722+0.2992i 0.6722-0.2992i 0.2],[1 1],1/2000,10)
Gt = gcz*gz
Gtm = (Gt*gf)/(1+Gt)
step(Gtm)
%rlocus(Gtm)