% problem 2.16 (***)
clear all; close all; clc;

a = 0.5;
N = 1000;

cond = @(b, c) b/sqrt(b^2 - 4*a*c); % wskaźnik uwarunkowania trudności
x1 = @(b, c) (-b-sqrt(b^2-4*a*c))/(2*a);

% disp(cond(1, 0.4999999999999999)); -> inf

b = 1 + 0.001*randn(1, N);
cArr = [0.001, 0.490, 0.500];

fprintf("-----------------------------\n");
for c=1:3
    arr = [];
    c_ = cArr(c);

    for i=1:N
        arr(length(arr) + 1) = x1(b(i), c_);
    end
    
    c_,
    mean_ = mean(arr), % średnia
    std_ = std(arr), % odchylenie

    fprintf("-----------------------------\n");
end