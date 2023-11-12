% problem 1.4 (*)
clear all; close all; clc;

h = [1,2,3,4],
v = [5;6;7;8],

a=h*v,
A=v*h,
a=A*v,
b=h*A,
B=A*A,

% Error:
% Incorrect dimensions for matrix multiplication.
% Check that the number of columns in the first matrix
% matches the number of rows in the second matrix.
% a=h*h,

% same as above
% b=v*v,

% same as above
% c=v*A,

% same as above
% d=A*h,