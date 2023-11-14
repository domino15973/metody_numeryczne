% problem 4.4 (*)
clear all; close all; clc;


A = [ 1 2; ...
      3 4 ];
b = [  5; ...
       11  ];
detA = det(A),          % wyznacznik macierzy A
x1 = inv(A)*b,          % x=A^(-1)*b
x2 = A\b,               % optymalne rozwiazywanie rown. Ax=b
x3 = pinv(A)*b,         % x = inv( A'*A ) * A' * b; macierz pseudoodwrotna
bhat1 = A*x1,           % sprawdzenie
bhat2 = A*x2,
bhat3 = A*x3,
err1 = max(abs(x1-x2)), % blad
err2 = max(abs(x1-x3)), 
% Oryginalnie wszystko ok.
% Przy zmianie wyznacznika z -2 na 1 nadal wszystko ok
% Im wyznacznik jest bliżej 0 tym większy jest błąd (rzędu 10^-14 więc dalej
% mimo wszystko mały, ale widać tendecję wzrostową)

disp('-------------------------------------------------------------------')

A2 = A+0.01*randn(size(A)),
detA2 = det(A2),
x4 = inv(A2)*b,
x5 = A2\b,
x6 = pinv(A2)*b,
b2hat4 = A2*x4,
b2hat5 = A2*x5,
b2hat6 = A2*x6,
err3 = max(abs(x4-x5)),
err4 = max(abs(x4-x6)),
% W tym przypadku b różni się nieznacznie od oryginalnego
% Wektory x również się różnią

disp('-------------------------------------------------------------------')

C = [1   52   43; ...
    101  51  633;
    79  1123   9];
d = [1; ...
     2;
     3];
detC = det(C),
x7 = inv(C)*d,
x8 = C\d,
x9 = pinv(C)*d,
dhat7 = C*x7,
dhat8 = C*x8,
dhat9 = C*x9,
err5 = max(abs(x7-x8)),
err6 = max(abs(x7-x9)),
% W tym przypadku dhat nie różni się od d
