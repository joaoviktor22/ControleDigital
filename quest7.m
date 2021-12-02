%Enunciado
G = [0.5 1;0.5 0.7]
H1 = [0.2;0.1]
H2 = [1;0]
I = eye(2)
syms z f1 f2 fa
F = [f1 f2]
C = [1 0]

%Questao 1
determinante = det(z*I - G + H1*F)
eq1 = [f1 + 0.5*f2 == 1,-0.4*f1 + 0.5*f2 == 6.5]
S1 = solve(eq1,[f1 f2])
s1f1 = S1.f1
s1f2 = S1.f2
F = [s1f1 s1f2]
M = C*inv(I - G + H1*F)*H1

%Questao 2
F = [f1 f2]
Gx = [G-H1*F H1*fa;-1*C 1]
determinante2 = det(z*eye(3) - Gx)
eq2 = [f2 + 2*f1 == 12,-2*fa + 0.5*f2 + 2.4*f1 == 5.5,-4*f1 + 5*f2 + 4*fa == 15]
S2 = solve(eq2,[f1 f2 fa])
s2f1 = S2.f1
s2f2 = S2.f2
s2fa = S2.fa

%Questao3
O = [C;C*G]
posto = rank(O)
L = [l1;l2]
det(z*I - G + L*C)