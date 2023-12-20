% problem 9.1 (*) - rzut ukośny
clear all; close all; clc;

% equnonlin_balista.m
m=5; v0=50; alpha=30; h=50; g=9.81; b=0.3;
alpha = alpha/180*pi;
x = 0 : 1 : 350;
y = h + tan(alpha)*x - g / (2*v0^2*cos(alpha)) * x.^2;
y2= h + (tan(alpha) + m*g / (b * v0 * cos(alpha))) * x + (g * m^2) * log(1 - x*b/(m*v0*cos(alpha))) / (b^2);
figure; plot(x,y); xlabel('x'); ylabel('y'); title('y(x)'); grid;
figure; plot(x,y2); xlabel('x'); ylabel('y'); title('y2(x)'); grid;

[~, index] = min(abs(y));
x1 = x(index)

[~, index] = min(abs(y2));
x2 = x(index)