% problem 4.2 (*)
clear all; close all; clc;

A = [1  2  3
     2  8 10
     3 10 22];

U_chol = chol(A),
[U, L] = myLu(A),
Ahat   = U * L,

function [L,U] = myLu(A) % dekompozycja Choleskiego - wzór z wikipedii
[N,N] = size(A);
   L = eye(N);
   for j=1:N
       value=0;
       for k=1:j-1
           value = value + L(j,k)^2;
       end
       L(j,j) = sqrt(A(j,j) - value);
       for i=j+1:N
           value = 0;
           for k=1:j-1
               value = value + L(i,k)*L(j,k);
           end
           L(i,j) = (1/L(j,j)) * (A(i,j) - value);
       end
   end
   U = L.';
end