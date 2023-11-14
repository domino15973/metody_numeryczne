% problem 4.1 (*)
clear all; close all; clc;

A = [5 3 2
     2 1 7
     8 2 3];

[L0, U0] = lu(A),
Ahat_lu = L0 * U0,

[L1, U1] = myLU(A),
Ahat_myLU = L1 * U1,

[L2, U2] = myLU2(A),
Ahat_myLU2 = L2 * U2,

function [L,U] = myLU(A)
[N,N] = size(A);
if(0) % prosciej, wolniej -----------------------------------------
  L = eye(N); U = zeros(N,N);
  for i = 1:N
      for j=i:N
          U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
      end
      for j=i+1:N
          L(j,i) = 1/U(i,i) * ( A(j,i) - L(j,1:i-1)*U(1:i-1,i) );
      end
  end
else % trudniej, szybciej ----------------------------------------
U=A; L=eye(N);
  for i=1:N-1
     for j=i+1:N
        L(j,i) = U(j,i) / U(i,i);
        U(j,i:N) = U(j,i:N) - L(j,i)*U(i,i:N);
     end
  end
end
end

function [L,U] = myLU2(A) % moja implementacja
   [N,N] = size(A);
   L = eye(N); U = zeros(N,N);
   for i = 1:N
       for j=1:i-1
          L(i,j) = 1 / U(j,j) * ( A(i,j) - L(i,1:j-1) * U(1:j-1,j) );
       end
       for j=i:N
           U(i,j) = A(i,j) - L(i,1:i-1) * U(1:i-1,j);
       end
   end
end