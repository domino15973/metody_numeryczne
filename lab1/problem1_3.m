% problem 1.3 (***)
clear all; close all; clc;

% Dane: S
% Szukane: Vmax, r, h

% 1: S = 2*pi*r*h + 2*pi*r^2
% 2: V(r, h) = pi*r^2*h

% po przeksztalceniu 1. => h = (S - 2*pi*r^2)/(2*pi*r)
% V(r) = pi*r^2 * (S - 2*pi*r^2)/(2*pi*r)
% z powyzszego => V(r) = 1/2 * S*r - pi*r^3
% szukamy Vmax(r)
% V'(r) = 1/2 * S - 3*pi*r^2
% V'(r) = 0 <=> r^2 = S/(6*pi) oraz r>0
% z powyzszego => Vmax dla r = sqrt(S / (6*pi))
% oraz dla h = S/(2*pi*r) - r


S = 200; % input value

fun = @(r) -(S*r/2 - pi*r^3); % V(r, S)
r = fminsearch(fun, 0);

% r = sqrt(S / (6*pi));

h = S/(2*pi*r) - r;
Vmax = pi * r^2 * h;
fprintf('Vmax = %f\nr = %f\nh = %f\n\n', Vmax, r, h);