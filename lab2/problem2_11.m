% problem 2.11 L (*)
clear all; close all; clc;

x = 10^(-50);
y = 10^200;
z = 10^300;

res1 = (x*y)/z, % tak
res2 = x*(y/z), % tak
res3 = (x/z)*y, % nie

realmin('double')