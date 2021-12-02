%questao1
syms k;

f = 0.5 - 0.5*(0.6^k);
zt = ztrans(f);%transformada z

syms z
u = z/(z-1);

g = zt/u;

iztrans(zt/u)%transformada inversa z
%questao2
syms s;

gho = (1 - exp(-0.05*s))/s
motorcc = 1/(s*((0.02*s)+1))
atraso = exp(-0.1*s)
auto = 0.4/((0.1*s)+1)
gma = gho*motorcc*atraso*auto

a = ilaplace(gma);
r = ztrans(a)
syms t
gmf = (0.4*t)/(s*((0.1*s)+1))
a = ilaplace(gmf)
r = ztrans(a)

z = tf('z')
h1 = tf(0.4,[0.1 1 0])
hd1 = c2d((h1),0.05,"zoh")


z = tf('z')
h1 = tf(0.4,[0.002 0.12 1 0],'InputDelay',0.1)
hd1 = c2d((h1),0.05,"zoh")

hd1mf = feedback(hd1,1)

ztrans(0.2*((0.6)^(k-1)))

