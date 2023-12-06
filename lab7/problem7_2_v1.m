% problem 7.2 v1 (*) - zrobione
clear all; close all; clc;

syms x; 
y = @(x) 2*x.^2 + x + 1/2;

h = 1;
x0 = 1;
 
xs = [x0, x0+h, x0+2*h];
ys = [y(x0), y(x0+h), y(x0+2*h)];
eval( (subs(diff(y,x,1), x, x0)) );
ys_diff_from_func = [eval( (subs(diff(y,x,1),x,x0)) ), eval( (subs(diff(y,x,1),x,x0+h)) ), eval( (subs(diff(y,x,1),x,x0+2*h)) )], % to dokładne wartości pochodnych
% diff(y,x,1) obliczanie pochodnej względem x
% subs podstawianie wartości x0 itd... za x 
% eval obliczanie wartości funkcji 

fp_1 = 1/(2*h) * (-3*ys(1) + 4*ys(2) - ys(3)),
fp_2 = 1/(2*h) * (ys(3) - ys(1)),
fp_3 = 1/(2*h) * (ys(1) - 4*ys(2) +3*ys(3)),
% to wartości z wzorów 7.16-7.18

errors = [abs(fp_1 - ys_diff_from_func(1)), abs(fp_2 - ys_diff_from_func(2)), abs(fp_3 - ys_diff_from_func(3))],