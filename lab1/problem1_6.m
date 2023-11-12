% problem 1.6 (*)
clear all; close all; clc;

% Definiowanie wektorow i macierzy
N = 256;
h = sin(2*pi/128*(0:N-1)); % wektor poziomy h
v = sin(4*pi/64*(0:N-1)).'; % wektor pionowy v
plot(h);
plot(v);

A = v*h;
mesh(A);