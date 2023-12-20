% problem 9.5.2 (**) - metoda newtona-raphsona
clear all; close all; clc;

deg_5  = [1,  5];
deg_45 = [2,  3];   % miejsca zerowe funkcji
deg_80 = [-2, 1];

f_sin = @(x) sin(x);   
f_5   = @(x) tan(deg2rad(5))/2  * (x - deg_5(1))  .* (x - deg_5(2));
f_45  = @(x) tan(deg2rad(45))/2 * (x - deg_45(1)) .* (x - deg_45(2));        % Deklaracja funkcji
f_80  = @(x) tan(deg2rad(80))/2 * (x - deg_80(1)) .* (x - deg_80(2));

df_sin = @(x) cos(x);
df_5   = @(x) 2 * tan(deg2rad(5))/2  * x - tan(deg2rad(5))/2  * sum(deg_5);
df_45  = @(x) 2 * tan(deg2rad(45))/2 * x - tan(deg2rad(45))/2 * sum(deg_45);     % Deklaracja pochodnych
df_80  = @(x) 2 * tan(deg2rad(80))/2 * x - tan(deg2rad(80))/2 * sum(deg_80);

tolerance = 0.00001;

it_sin = 1;
it_5   = 1;
it_45  = 1;
it_80  = 1;

newton_raphson_sin = 0;
newton_raphson_5   = 0;
newton_raphson_45  = 0;
newton_raphson_80  = 0;


while abs(newton_raphson_sin(end)-pi) > tolerance 
    it_sin = it_sin + 1;
    newton_raphson_sin = nonlinsolvers(f_sin, df_sin, pi-pi/5, pi+pi/5, 'newton-raphson', it_sin);
end
disp('Osiągnięto wymaganą dokładność dla sinusa. Liczba iteracji: ');
disp(it_sin);

while abs(newton_raphson_5(end)-deg_5(1)) > tolerance && abs(newton_raphson_5(end)-deg_5(2)) > tolerance
    it_5 = it_5 + 1;
    newton_raphson_5 = nonlinsolvers(f_5, df_5, 0, 0, 'newton-raphson', it_5);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 5/10. Liczba iteracji: ');
disp(it_5);

while abs(newton_raphson_45(end)-deg_45(1)) > tolerance && abs(newton_raphson_45(end)-deg_45(2)) > tolerance
    it_45 = it_45 + 1;
    newton_raphson_45 = nonlinsolvers(f_45, df_45, 0, 0, 'newton-raphson', it_45);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 45. Liczba iteracji: ');
disp(it_45);

while abs(newton_raphson_80(end)-deg_80(1)) > tolerance && abs(newton_raphson_80(end)-deg_80(2)) > tolerance
    it_80 = it_80 + 1;
    newton_raphson_80 = nonlinsolvers(f_80, df_80, 0, 0, 'newton-raphson', it_80);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 80. Liczba iteracji: ');
disp(it_80);


figure;
title("Metoda Newtona-Raphsona")
subplot(2, 2, 1);
plot(1:it_sin, newton_raphson_sin, "bo-"), xlabel('iter'); title('Sinus');
subplot(2, 2, 2);
plot(1:it_5, newton_raphson_5, "bo-"), xlabel('iter'); title('Parabola o nachylniu 5%');
subplot(2, 2, 3);
plot(1:it_45, newton_raphson_45, "bo-"), xlabel('iter'); title('Parabola o nachylniu 45%');
subplot(2, 2, 4);
plot(1:it_80, newton_raphson_80, "bo-"), xlabel('iter'); title('Parabola o nachylniu 80%');