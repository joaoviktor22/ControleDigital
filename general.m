%% Transformada z de G(s) com segurador de ordem zero em série;

%syms s z
%G_ghz= tf([1],[1 5 6]);
%G_ghz_d = c2d(G_ghz,0.1)

%% Retangular pra frente

%T= 0.1;
%s=tf([1 -1],T);
%Gf = (1/(s^2+5*s+6))

%% Retangular pra trás

%T= 0.1;
% s=tf([1 -1],[T 0]);
% Gb = minreal(1/(s^2+5*s+6))

%% REGRA TRAPEZOIDAL
% G=tf([1],[1 5 6]);
% Gtr = c2d(G,T,"tustin")

%% REGRA DOS POLOS EXATOS
% G=tf([1],[1 5 6]);
% Gtr = c2d(G,T,"matched")

%% PARTIAL FRACTION DECOMPOSITION

%  num = [1];
%  den = [1 2 0 0];
%  [r,p,k] = residue(num,den)

%% INVERSE LAPLACE TRANSFORM

%syms s
%F = (100*s+500)/(s^2+5*s+6);
%ilaplace(F)

%% LAPLACE TRANSFORM

%syms t 
%f = 300*exp(-2*t) -200*exp(-3*t);
%laplace(f)

%% FIND ROOTS
% p = [1 -1.490785 -0.314762];
% r = roots(p)

%% Differentiate quotient of polynomials
% num = [-1 1.368 -0.3679];
% den = [0.003679 0.002642];
% [q,d]= polyder(num,den) 

%% ROOT LOCUS
% H = tf([0.01758 0.0153879498],[1 -1.67032 0.67032],-1)
% rlocus(H)
% zgrid
% axis equal
% axis([-2.5 1.5 -2 2])

%% SOLVE LINEAR EQUATIONS
% syms x y z
% eqn1 = 100*x + (100^2)*y + (100^3)*z == 645E-6;
% eqn2 = 907*x + (907^2)*y + (907^3)*z == 3375E-6;
% eqn3 = 2162*x + (2162^2)*y + (2162^3)*z == 9149E-6;
% 
% sol = solve([eqn1, eqn2, eqn3], [x, y, z]);
% xSol = sol.x
% ySol = sol.y
% zSol = sol.z

%% PLOTS

%% PLOT CONTINUOUS TIME
% k = 0:0.1:100;
% real = 300*exp(-0.2*k) - 200*exp(-0.3*k);
% plot(k,real)
% hold on

%% PLOT DISCRETE TIME
% Y1 = 273.1710*power(0.8236,k) - 173.1710*power(0.7364,k);
% stairs(k,Y1)
% hold on
% 
% ylim([0 101])
% title('Respostas para métodos de discretização')
% xlabel('kT')
% ylabel('y[k]')

%% PLOT BY SIMULINK 

% K = 12.6643*0.01758;
% stairs(out.out_tf.Data)
% xlim([0 50])
% title('Resposta para entrada degrau com controlador novo')
% xlabel('Tempo com Sample time de 0.2s')
% ylabel('Saída')
% legend('R','C' )