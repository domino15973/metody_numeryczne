% problem 1.1 (*)
clear all; close all; clc;

% 1)
circleR = 10; % input value
circleArea = pi * circleR^2;
fprintf('Area of the circle (r = %f) is %f\n', circleR, circleArea);

circleLength = 2 * pi * circleR;
fprintf('Length of the circle (r = %f) is %f\n\n', circleR, circleLength);

% 2)
sphereR = 10; % input value
sphereArea = 4 * pi * sphereR^2;
fprintf('Area of the sphere (r = %f) is  %f\n', sphereR, sphereArea);

sphereVolume = 4/3 * pi * sphereR^3;
fprintf('Volume of the sphere (r = %f) is %f\n\n', sphereR, sphereVolume);

% 3)
kphV = 50; % input value
mpsV = kphV / 3.6;
fprintf('%d kph = %f mps\n\n', kphV, mpsV)

% 4)
c = 55;
d = 16 / 25 * c;
h = 9 / 25 * c;
fprintf('c = %d [inch]\nh = %f [inch]\nd = %f [inch]\n\n', c, h, d)