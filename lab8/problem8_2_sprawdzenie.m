% problem 8.2 (*) - sprawdzenie
clear all; close all; clc;

% Kąt obrotu
phi = pi/4; % Przykładowy kąt ϕ

% Macierz kowariancji elipsy
S = [ 2   1; ...                
      1   2 ];

% Obliczenie EVD
[V, D] = eig(S),

% Sprawdzenie czy V jest macierzą obrotu o kącie ϕ
R = [cos(phi) -sin(phi); sin(phi) cos(phi)],
 
V * R,

% Jeśli macierz V składająca się z wektorów własnych jest generowana poprzez 
% rozkład EVD (Eigenvalue Decomposition) symetrycznej macierzy  
% to wektory własne są osiami elipsy, 
% a wartości własne reprezentują długości osi elipsy 
% wzdłuż osi odpowiadających wektorom własnym.

% W przypadku, gdy macierz kowariancji reprezentuje elipsę, a wektory własne tej macierzy są osiami elipsy, 
% to macierz transformacji V, która przekształca okrąg na elipsę, może być interpretowana 
% jako macierz obrotu, która obraca początkowy okrąg wzdłuż osi wyznaczonych przez wektory własne, 
% tworząc elipsę.

% wartości wektorów własnych są dość podobne