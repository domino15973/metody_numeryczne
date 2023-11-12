% problem 2.4 L (*)
clear all; close all; clc;

res1 = num2bitstr(single((1+1/4)*2^(-124)));
res2 = num2bitstr(single(-5.877472*10^(-38)));
res3 = num2bitstr(double((1+1/4)*2^(-124)));
res4 = num2bitstr(double(-5.877472*10^(-38)));

ans1 = num2bitstr(single(299792458));
ans2 = num2bitstr(double(299792458));

a = bit2num (ans1, 32)
b = bit2num (ans2, 64)