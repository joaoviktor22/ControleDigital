global m g L k R x1 x2 x3 T ts Mp F fa L G H C
m = 0.04;%massa do objeto em Kg
g = 9.81;%gravidade
L = 0.01;%Indutancia
k = 0.0001;%Capacitancia
R = 1.2;%Resistencia
x1 = 0.012;%Posicao do objeto em m
x2 = 0;%Velocidade do objeto em m/s
x3 = x1*sqrt(g*m/k)%corrente
T = 0.01;%Periodo de Amostragem em s
A = [0 1 0;(k*(x3^2))/(m*(x1^3)) 0 (-2*k*x3)/(m*(x1^2));0 (2*k*x3)/(L*(x1^2)) -R/L]%espaco estados tempo continuo
B = [0;0;1/L]
C = [1 0 0]
sys = ss(A,B,C,0)
dyd = c2d(sys,T)
[G,H,C,D] = ssdata(dyd)

ts = 0.5;%tempo de subida em s
Mp = 0.05;%Sobressinal

fi = -log(Mp)/(sqrt((pi^2) + (log(Mp)^2)))
wn = 4/(ts*fi)
polos = -(fi*wn) + j*wn*sqrt(1 - (fi^2))
z = exp(polos*T)
mag = abs(z)
fase = phase(z)
poloz1 = mag*(cos(fase) + j*sin(fase))
poloz2 = mag*(cos(fase) - j*sin(fase))

syms f1 f2 f3 z fa;

Contr = [H G*H G*G*H]
controlavel = rank(Contr)
O = [C;C*G;C*G*G]
observavel = rank(O)
I = eye(3)
F = [f1 f2 f3];
Gx = [G-H*F H*fa;-1*C 1]
determinante = det(z*eye(4) - Gx)
coeficiente1 = coeffs(determinante,z,'All')
equacaodesejada = simplify((z - poloz1)*(z - poloz2)*z*z)
coeficiente2 = coeffs(equacaodesejada,z,'All')
equacao = coeficiente1 == coeficiente2
S1 = solve(equacao,[f1 f2 f3 fa])
s1f1 = double(S1.f1)
s1f2 = double(S1.f2)
s1f3 = double(S1.f3)
s1fa = double(S1.fa)
F = [s1f1 s1f2 s1f3]
fa = double(s1fa)

O = [C;C*G;C*G*G]
rank(O)
syms l1 l2 l3
L = [l1;l2;l3]
determinante = det(z*I - G + L*C)
coeficiente1 = coeffs(determinante,z,'All')
equacaodesejada = simplify((z - (poloz1/2))*(z - (poloz2/2))*z)
coeficiente2 = coeffs(equacaodesejada,z,'All')
equacao = coeficiente1 == coeficiente2
S1 = solve(equacao,[l1 l2 l3])
s1l1 = double(S1.l1)
s1l2 = double(S1.l2)
s1l3 = double(S1.l3)
L = [s1l1;s1l2;s1l3]
