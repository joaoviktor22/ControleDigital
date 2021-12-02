syms z
h = ((-z^2)+(1.3679*z)-0.003679)/((0.003679*z)+0.002642)
r = diff(h,z)
vpa(simplify(r),3)

p = [-1 1.3679 -0.3679];
v = [0.003679 0.002642];
[q,d] = polyder(p,v)
roots(q)

H = tf([0.003679 0.002642],[1 -1.3679 0.3679],0.1)
rlocus(H)
zgrid
axis equal

syms w a
n = (0.003679*w*(a-1))-(w*(0.003679*a+0.002642));
d = ((0.003679*a+0.002642)*(a-1)) + (w^2)*0.003679;
n = (n*(a-exp(-1)))/w;
d = (d);
n = vpa(simplify(n),4)
d = vpa(simplify(d),4)
a = vpa(simplify(d/n),4)
