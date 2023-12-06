% problem 7.1 (*) - zrobione
clear all; close all; clc;

syms x;
y = @(x) sin(x);
x0 = pi/8; h = pi/8;
xs = [x0-h, x0, x0+h]; % trzy podane w treści zadania punkty; 
ys = [y(xs(1)), y(xs(2)), y(xs(3))]; % wartości funkcji sinus dla podanych punktów


% wartości a,b,c dla wzoru Simpsona
a = 1/3;
b = 4/3; 
c = 1/3;
% wzór Simpsona
A_simpson = h * (a*ys(1) + b*ys(2) + c*ys(3)),


% wartości a,b,c dla sumy trapezów
a = 1/2;
b = 1; 
c = 1/2;
% suma trapezów
A_trapez = h * (a*ys(1) + b*ys(2) + c*ys(3)),


% całka
A_integral = integral(y, x0-h, x0+h),


% Funkcję sinus można przedstawić jako sumę nieskończonego szeregu
% Maclaurina wokół punktu x=0. Ten szereg ma postać:
% sin(x) = x - (x^3/3!) + (x^5/5!) - (x^7/7!) + ...
% Im więcej składników tego szeregu uwzględnimy, 
% tym dokładniejsze będzie przybliżenie funkcji sinus w okolicy punktu x=0