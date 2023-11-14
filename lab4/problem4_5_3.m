% problem 4.5 (***) - część 3 
clear all; close all; clc;

A = [1  2  3  4; ...
     3  4  6  8;
     9 10  2 12;
     9 11 15  3],
N = size(A);
Z = zeros(N(1), N(1));
A_inv = odwrot_recursive(A, N(1), N(1), N(1)),
N = size(A_inv);
A_corr = odwrot_recursive(A_inv, N(1), N(1), N(1)),

function [U] = odwrot_recursive(A, row_index, column_index, matrix_size)
    global Z;
    if row_index == 1   
        if column_index == 1
            Matrix_dop = create_dop_matrix(A, row_index, column_index);
            Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
        else
            odwrot_recursive(A, row_index, column_index - 1, matrix_size);
            Matrix_dop = create_dop_matrix(A, row_index, column_index);
            Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
        end
    
    else
        if column_index == 1
            Matrix_dop = create_dop_matrix(A, row_index, column_index);
            Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
        else
            odwrot_recursive(A, row_index, column_index - 1, matrix_size);
            Matrix_dop = create_dop_matrix(A, row_index, column_index);
            Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
        end
        
        if column_index == matrix_size
            odwrot_recursive(A,row_index-1, matrix_size, matrix_size);
        end
    end
    
    if row_index == matrix_size && column_index == matrix_size
        U = (1/(det(A))) * Z.';
    end
end

function [Do] = create_dop_matrix(A, row_index, column_index)
    Do = A;
    Do(row_index, :) = [];
    Do(:, column_index) = [];
end