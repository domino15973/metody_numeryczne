% problem 9.3.1 (**) - metoda regula-falsi
clear all; close all; clc;

deg_5  = [1,  5];
deg_45 = [2,  3];   % miejsca zerowe funkcji
deg_80 = [-2, 1];

f_sin = @(x) sin(x);   
f_5  = @(x) tan(deg2rad(5))/2  * (x - deg_5(1))  .* (x - deg_5(2));
f_45 = @(x) tan(deg2rad(45))/2 * (x - deg_45(1)) .* (x - deg_45(2));        % Deklaracja funkcji
f_80 = @(x) tan(deg2rad(80))/2 * (x - deg_80(1)) .* (x - deg_80(2));

df_sin = @(x) cos(x);
df_5  = @(x) 2 * tan(deg2rad(5))/2  * x - tan(deg2rad(5))/2  * sum(deg_5);
df_45 = @(x) 2 * tan(deg2rad(45))/2 * x - tan(deg2rad(45))/2 * sum(deg_45);     % Deklaracja pochodnych
df_80 = @(x) 2 * tan(deg2rad(80))/2 * x - tan(deg2rad(80))/2 * sum(deg_80);

x = linspace(-5, 5, 100);

figure;

subplot(1, 4, 1);
plot(x, f_5(x), 'b-', x, df_5(x), 'r-');
title('5-10 stopni'); xlabel('x'); grid on;
legend('Funkcja z nachyleniem 5 stopni', 'Jej pochodna');

subplot(1, 4, 2);
plot(x, f_45(x), 'b-', x, df_45(x), 'r-');
title('45 stopni'); xlabel('x'); grid on;
legend('Funkcja z nachyleniem 45 stopni', 'Jej pochodna');

subplot(1, 4, 3);
plot(x, f_80(x), 'b-', x, df_80(x), 'r-');
title('80 stopni'); xlabel('x'); grid on;
legend('Funkcja z nachyleniem 80 stopni', 'Jej pochodna');

subplot(1, 4, 4);
plot(x, f_sin(x), 'b-', x, df_sin(x), 'r-');
title('sinus'); xlabel('x'); grid on;
legend('Funkcja sinus', 'Jej pochodna');

pause;

it = 12;

regula_falsi_sin = nonlinsolvers(f_sin, df_sin, pi-pi/5, pi+pi/5, 'regula-falsi', it);
regula_falsi_5  = nonlinsolvers(f_5,  df_5,  0, 2.5, 'regula-falsi', it);       
regula_falsi_45 = nonlinsolvers(f_45, df_45, 1, 2.9, 'regula-falsi', it);  % szacowanie miejsc zerowych  
regula_falsi_80 = nonlinsolvers(f_80, df_80, 0,   3, 'regula-falsi', it);

figure;
subplot(1, 4, 1);
grid on;
plot(1:it, regula_falsi_45, 'o-'); xlabel('iter'); ylabel('cb(iter)');
title("45 stopni");
subplot(1, 4, 2);
plot(1:it, regula_falsi_5, 'o-'); xlabel('iter'); ylabel('cb(iter)');
title("5 stopni");
subplot(1, 4, 3);
plot(1:it, regula_falsi_80, 'o-'); xlabel('iter'); ylabel('cb(iter)');
title("80 stopni");
subplot(1, 4, 4);
plot(1:it, regula_falsi_sin, 'o-'); xlabel('iter'); ylabel('cb(iter)');
title("sinus");
