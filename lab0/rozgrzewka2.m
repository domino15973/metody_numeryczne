% rozgrzewka 2
clear all; close all; clc;

x = -5 : 0.01 : 5;
y1 = zeros(1,length(x));
y2 = zeros(1,length(x));
sizex = size(x,2);

for i = 1:1:length(x)
    y1(i) = x(i).^2 + 1;
    y2(i) = x(i).^3+x(i).^2+x(i)+1;
end

plot(x,y1)
hold on
plot(x,y2)
grid
