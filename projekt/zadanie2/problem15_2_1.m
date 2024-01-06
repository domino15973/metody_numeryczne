clear all; close all; clc;

a = input("Give float point number: ");
n = input("Give number bits for integer part of number: ");
m = input("Give number bits for fraction part of number: ");

floatingPointConversion(a, n, m);

function floatingPointConversion(a, n, m)
    % Convert to binary
    binaryRepresentation = convertToBinary(a, n, m);

    % Display the binary representation
    disp('Binary representation:');
    disp(binaryRepresentation);

    % Convert back to decimal
    decimalValue = convertToDecimal(binaryRepresentation, n, m);

    % Display the decimal value
    disp('Converted back to decimal:');
    disp(decimalValue);
end

function binaryRepresentation = convertToBinary(a, n, m)
    % Calculate integer and fractional parts
    integerPart = fix(a);
    fractionalPart = a - integerPart;

    % Convert integer part to binary
    intBinary = fix(rem(fix(integerPart) * pow2(-(n-1):0), 2));

    % Convert fractional part to binary
    fracBinary = fix(rem(fractionalPart * pow2(1:m), 2));

    % Concatenate integer and fractional binary representations
    binaryRepresentation = [intBinary, fracBinary];
end

function decimalValue = convertToDecimal(binaryRepresentation, n, m)
    % Calculate the inverse transformation
    powers = [n-1:-1:0, -(1:m)];
    decimalValue = binaryRepresentation * pow2(powers).';

    % Convert to decimal
    decimalValue = sum(decimalValue);
end