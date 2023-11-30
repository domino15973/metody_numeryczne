% problem 6.1 (*)
clear all; close all; clc;

% x = 3; y = 2;

%  3x - 2y = 5
% -2x +  y = -4
%   x + 3y = 9
%       2y = 4

A = [ 3,-2;
     -2, 1;
      1, 3;
      0, 2],

b = [5; 
    -4; 
     9; 
     4],

X = inv(transpose(A) * A) * transpose(A) * b,