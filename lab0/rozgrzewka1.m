% rozgrzewka 1
clear all; close all; clc;

x = -5:0.1:5;
y1 = x.^2+1;
y2 = x.^3+x.^2+x+1;
plot(x,y1)
hold on
plot(x,y2)
grid
