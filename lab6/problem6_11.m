% problem 6.11 (***)
clear all; close all; clc;

p = @(x, A0, A1, A2, B1, B2) (A0 + A1*x + A2*x.^2)./(1 + B1*x + B2 * x.^2);
xVal = linspace(-5,5,100); % wektor z 100 równo rozłożonymi punktami między -5 a 5

syms x; % zmienne symboliczne
taylorF = taylor(erf(x), 'Order', 5), % rozwinięcie szeregu Taylora do piątego rzędu dla funkcji erf

syms A0 A1 A2 A3 B1 B2 B3; % zmienne symboliczne

equations = [A0 == 0, A1 == 2/pi^(1/2), A2 == 0, B2 == 1/3, B1 == 0]; % układ równań symbolicznych

sol = solve(equations, [A0, A1, A2, B1, B2]); % rozwiązanie układu równań symbolicznych
disp(sol); % wyświetlenie wyniku

figure;
plot(xVal, erf(xVal),"g-"); % funkcja erf - zielona 
hold on;
plot(xVal, p(xVal, sol.A0, sol.A1, sol.A2, sol.B1, sol.B2), "ro"); % przybliżenie Padego - czerwona
grid on;
legend("erf(x)", "Pade");