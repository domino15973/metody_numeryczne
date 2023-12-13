% problem 8.3 (*)
clear all; close all; clc;

% evd_power.m
tolerance = 1e-6;                % tolerancja dla warunku stopu

if(0) A = [ 4 0.5; 0.5 1 ];       % wybor/definicja symetrycznej macierzy kwadratowej
else  A = magic(6)
end
[ N, N ] = size(A);               % wymiar 

x = ones(N, 1);                  % inicjalizacja
max_iterations = 1000;           % maksymalna liczba iteracji

for i = 1:max_iterations         % pętla
    y = A * x;                   % mnożenie
    [ymax, imax] = max(abs(y));  % maksimum bezwzględne
    lambda = ymax;               % wartość własna
    x = y / ymax;                % nowy wektor własny
end

x, lambda,     
% x wektor własny
% labmda wartość własna 
[ V, D ] = eig(A)                 % porownaj z funkcja Matlaba
% Wektor własny x jest normalizowany przez podzielenie go przez max wartość
% bezwzględną, tutaj mogą wystąpic rozbieżnośći    
% eig dobiera najoptymalniejszy algorytm pod daną macierz żeby dać jak
% najdokładniejsze wyniki