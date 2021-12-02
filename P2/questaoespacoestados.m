%Enunciado
G = [0.8825 0.94;0 1]
H1 = [0.8825;1]
I = eye(2)
syms z f1 f2 fa
F = [f1 f2]
C = [1 0]

%Questao 3 letra b
determinante1 = det(z*I - G)
Contr = [H1 G*H1]
posto = rank(Contr)
determinante = det(z*I - G + H1*F)
coeficiente1 = coeffs(determinante,z,'All')
equacaodesejada = simplify((z - 0.4 + 0.4i)*(z - 0.4 - 0.4i))
coeficiente2 = coeffs(equacaodesejada,z,'All')
equacao = coeficiente1 == coeficiente2
S1 = solve(equacao,[f1 f2])
s1f1 = S1.f1
s1f2 = S1.f2
F = [s1f1 s1f2]
inv(I - G + H1*F)
M = C*inv(I - G + H1*F)*H1
N = 1/M

%Questao 2
%F = [f1 f2]
%Gx = [G-H1*F H1*fa;-1*C 1]
%determinante2 = det(z*eye(3) - Gx)
%coeficiente3 = coeffs(determinante2,z,'All')
%equacaodesejada2 = simplify((z - 0.66 + 0.38i)*(z - 0.66 - 0.38i)*z)
%coeficiente4 = coeffs(equacaodesejada2,z,'All')
%equacao = coeficiente3 == coeficiente4
%S2 = solve(equacao,[f1 f2 fa])
%s2f1 = S2.f1
%s2f2 = S2.f2
%s2fa = S2.fa

%Questao3 letra 
syms L1 L2 L3
C = [1 0 0]
G2 = [0.8825 0.94 0.8825;0 1 1;0 0 1]
O = [C;C*G2;C*G2*G2]
posto = rank(O)
L = [L1;L2;L3]
determinante2 = det(z*eye(3) - G2 + L*C)
coeficiente3 = coeffs(determinante2,z,'All')
equacaodesejada2 = simplify((z - 0.2 + 0.2i)*(z - 0.2 - 0.2i)*z)
coeficiente4 = coeffs(equacaodesejada2,z,'All')
equacao = coeficiente3 == coeficiente4
S2 = solve(equacao,[L1 L2 L3])
s2L1 = S2.L1
s2L2 = S2.L2
s2L3 = S2.L3