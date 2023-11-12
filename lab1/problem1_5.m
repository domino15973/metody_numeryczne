% problem 1.5 (*)
clear all; close all; clc;

% Definiowanie wektorow i macierzy
h = [ 1, 2, 3, 4 ], % wektor poziomy h, elementy oddzielone przecinkiem
v = [ 5; 6; 7; 8 ], % wektor pionowy v, elementy oddzielone srednikiem
H = [ h; h; h; h ], % macierz H jako wynik skladania poziomych wierszy
V = [ v, v, v, v ], % macierz V jako wynik skladania pionowych kolumn
ht = h', Ht = H', % (’) transpozycja plus sprzezenie zespolone (.’) tylko transpozycja
A = rand(4,4), % macierz A (liczb losowych) o wymiarach 3x3
B = A(2:4,2:4), % macierz B jako wycinek macierzy A: od 2-go do 3-go wiersza/kolumny
Nh = length(h), % liczba elementow wektora h
[M,N] = size(H), % wymiary macierzy H

% Operacje wektorowo-macierzowe
liczba = h*v, % iloczyn skalarny: wektor poziomy razy pionowy -> jedna liczba
macierz = v*h, % iloczyn wektorowy: wektor pionowy razy poziomy -> macierz
wektor1 = H*v, % iloczyn macierzy i wektora pionowego
wektor2 = h*H, % iloczyn wektora poziomego i macierzy
HdV = H+V, HmV = H*V, % dodawanie i mnozenie macierzy
C(4,4) = h(1)+V(2,3), % suma jednego elementu wektora h oraz macierzy V