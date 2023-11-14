% problem 4.5 (***) - część 1 
clear all; close all; clc;

A = [1 2; ...
     3 4],

A_odwr = odwrot_rzad2(A),
if A_odwr == 0
   disp("Zacznij od początku");
else
   A_corr = odwrot_rzad2(A_odwr),
   if(A == A_corr)
       disp("Odwrócenie prawidłowe");
   end
end

function [U] = odwrot_rzad2(A)
    if det(A) == 0
        U = 0;
    else
        U = 1/(A(1,1)*A(2,2) - A(2,1)*A(1,2)) * [A(2,2) -A(1,2); ...
                                        -A(2,1) A(1,1)];
    end
end


