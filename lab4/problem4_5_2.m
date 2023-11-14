% problem 4.5 (***) - część 2 
clear all; close all; clc;

A = [1 21 3; ...
     4 51 6;
     7 8  9],
    
detA = det(A);
A_odwr = odwrot_rzad3(A),
if A_odwr == 0
   disp(" ");
else
   detU = det(A_odwr);
   A_corr = odwrot_rzad3(A_odwr),
   if A_corr == 0
       disp(" ");
   else
       if A_corr == A
           disp("Wszystko zadziałało poprawnie");
       end
   end
end
err = max(abs(A - A_corr)),


function [U] = odwrot_rzad3(A)
    if det(A) == 0
        U = 0;
        disp("Wyznacznik nie może być równy 0!!!");
    else
        N = size(A);
        Z = zeros(N(1),N(1));
    for i=1:N
        for j=1:N
            Matrix_dop = A;
            Matrix_dop(i,:) = [];
            Matrix_dop(:,j) = [];
            Z(i,j) = (-1).^(i+j) * det(Matrix_dop);
        end
    end
    U = (1/(det(A))) * Z.';
    end
end

