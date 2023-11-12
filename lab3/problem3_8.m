% problem 3.8 (**)
clear all; close all; clc;

N = 2^13; % ilosc probek (8196, musi byc mniej niż ma nagranie)

% wczytanie danych
[canary, canary_fpr] = audioread('canary.wav', [1, N]);
[elephant, elephant_fpr] = audioread('elephant.wav', [1, N]);

% wykres dźwięku w czasie
figure; plot(canary); title('canary');
figure; plot(elephant); title('elephant');

% nałożone ścieżki dźwiękowe
canele = canary + elephant;

% A - macierz ortagonalna 
% pomnożenie przez macierz A daje nam widmo częstotliwościowe
% widmo częstotliwościowe - wszystkie częstotliwości, które po złożeniu dają nam oryginalną ścieżkę dźwiękową
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
canary_freq_spectrum = A * canary;
elephant_freq_spectrum = A * elephant;
figure; plot(canary_freq_spectrum); title('canary freq spec');
figure; plot(elephant_freq_spectrum); title('elephant freq spec');

% widmo częstotliwościowe łączonej ścieżki dźwiękowej
canele_fs = A * canele;
figure; plot(canele_fs); title('canele freq spec');

% od łączonego widma odejmujemy widmo słonia
back_canary_fs = canele_fs - elephant_freq_spectrum;

% zmieniamy widmo na ścieżkę dźwiękową
back_canary = A^-1 * back_canary_fs;
figure; plot(back_canary); title('back canary');
