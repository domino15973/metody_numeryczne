% problem 6.10 (**)
clear all; close all; clc;

f= @(x) 1./(1+x.^2);
p = @(x, A0, A1, A2, B1, B2) (A0 + A1*x + A2*x.^2)./(1 + B1*x + B2 * x.^2);
xVal = linspace(-5,5,100); % wektor z 100 równo rozłożonymi punktami między -5 a 5

syms x; % zmienne symboliczne
symF = f(x); % wyrażenie symboliczne dla funkcji f
taylorF = taylor(symF, 'Order', 5), % rozwinięcie szeregu Taylora do piątego rzędu dla funkcji f

syms A0 A1 A2 B1 B2; % zmienne symboliczne

equations = [A0 == 1, A1 == B1, A2 == B2 - 1, B1 == 0, B2 == 1]; % układ równań symbolicznych

sol = solve(equations, [A0, A1, A2, B1, B2]); % rozwiązanie układu równań symbolicznych
disp(sol); % wyświetlenie wyniku

figure;
plot(xVal, f(xVal),"g-"); % orginalna funkcja - zielona 
hold on;
plot(xVal, p(xVal, sol.A0, sol.A1, sol.A2, sol.B1, sol.B2), "ro"); % przybliżenie Padego - czerwona
grid on;
legend("f(x)", "Pade");