% problem 8.6 (*)
clear all; close all; clc;

% svd_ar.m
N = 2000;                      % liczba analizowanych probek danych, przykładowe 5000
fpr = 10000;                   % liczba probek danych na sekunde
dt = 1/fpr;                    % okres probkowania
f = [ 1000  2000  3000  4000]; % liczba powtorzen na sekunde skladowych sinusoidalnych
d = [ 1     2     3     4];    % tlumienie kolejnych skladowych
A = [ 1     0.5   0.25  0.5];  % amplituda kolejnych skladowych
K = length(f);                 % liczba skladowych sygnalu
x = zeros(1,N);                % inicjalizacja danych

for k = 1 : K               % generacja i akumulacja kolejnych sinusoid 
   x =  x + A(k) * exp(-d(k)*(0:N-1)*dt) .* cos(2*pi*f(k)*(0:N-1)*dt + pi*rand(1,1));
end

SNR = 60; 
x = awgn(x,SNR);                   % dodanie szumu, poziom w decybelach

figure; plot(x); grid; title('x(n)');        % pokazanie sygnalu

[fest1, dest1 ] = fLP(x,K,dt),               % metoda LP Prony'ego
[fest2, dest2 ] = fLPSVD(x,K,dt),            % metoda LP-SVD Kumaresana-Tuftsa
[fest1 fest2], [dest1 dest2],                % porownanie

% błąd estymowanych wartości częstości i tłumienia w porównaniu do
% rzeczywistych wartości (f.' oraz d.')
err_fest1 = max(abs(fest1 - f.')),
err_dest1 = max(abs(dest1 - d.')),
err_fest2 = max(abs(fest2 - f.')),
err_dest2 = max(abs(dest2 - d.')),

if err_fest1 > err_fest2
   disp("flp wygrywa")
else
   disp("flpsvd wygrywa")
end

if err_dest1 > err_dest2
   disp("flp wygrywa")
else
   disp("flpsvd wygrywa")
end

% flp
% im więcej próbek tym mniejszy błąd
% wyższe wartości składowych dają mniejszy błąd
% im więcej składowych tym mniejszy błąd
% w miarę zwiększania wartości SNR, błąd się zmniejsza

% flpsvd
% im więcej próbek tym mniejszy błąd
% wyższe wartości składowych dają mniejszy błąd
% im więcej składowych tym mniejszy błąd
% w miarę zwiększania wartości SNR, błąd się zmniejsza

% flp to lepszy wybór (dużo szybszy)