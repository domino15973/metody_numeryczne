% problem 9.3.2 (**) - metoda regula-falsi
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

regula_falsi_sin = 0;
regula_falsi_5   = 0;
regula_falsi_45  = 0;
regula_falsi_80  = 0;


x_5  = 1;
x_45 = 2;
x_80 = 1;


while (abs(regula_falsi_sin(end)-pi)) > tolerance
    it_sin = it_sin + 1;
    regula_falsi_sin = nonlinsolvers(f_sin, df_sin, pi-pi/5, pi+pi/5, 'regula-falsi', it_sin);
end
disp('Osiągnięto wymaganą dokładność dla sinusa. Liczba iteracji: ');
disp(it_sin);

while (abs(regula_falsi_5(end)-x_5)) > tolerance
    it_5 = it_5 + 1;
    regula_falsi_5 = nonlinsolvers(f_5, df_5, -1, 3, 'regula-falsi', it_5);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 5. Liczba iteracji: ');
disp(it_5);

while (abs(regula_falsi_45(end)-x_45)) > tolerance
    it_45 = it_45 + 1;
    regula_falsi_45 = nonlinsolvers(f_45, df_45, 1, 2.5, 'regula-falsi', it_45);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 45. Liczba iteracji: ');
disp(it_45);

while (abs(regula_falsi_80(end)-x_80)) > tolerance
    it_80 = it_80 + 1;
    regula_falsi_80 = nonlinsolvers(f_80, df_80, -1, 3, 'regula-falsi', it_80);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 80. Liczba iteracji: ');
disp(it_80);


figure;
subplot(2, 2, 1);
plot(1:it_sin, regula_falsi_sin, "bo-"), xlabel('iter'); title('Sinus');
subplot(2, 2, 2);
plot(1:it_5, regula_falsi_5, "bo-"), xlabel('iter'); title('Parabola o nachylniu 5%');
subplot(2, 2, 3);
plot(1:it_45, regula_falsi_45, "bo-"), xlabel('iter'); title('Parabola o nachylniu 45%');
subplot(2, 2, 4);
plot(1:it_80, regula_falsi_80, "bo-"), xlabel('iter'); title('Parabola o nachylniu 80%');