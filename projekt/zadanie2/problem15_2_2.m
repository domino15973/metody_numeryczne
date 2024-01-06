clear all; close all; clc;

userInput = input('Enter a floating-point number: ');

% Convert the number to binary and display
binaryRepresentation = floatToBinary(userInput);
disp(['Binary representation: ', num2str(binaryRepresentation)]);

% Convert binary back to decimal and display the result
decimalResult = binaryToFloat(binaryRepresentation);
disp(['After conversion back to decimal: ', num2str(decimalResult)]);

function binary = floatToBinary(number)
    % Convert a floating-point number to binary representation
    binary = arrayfun(@(x) str2double(x), dec2bin(typecast(single(number), 'uint32'), 32));
end

function decimal = binaryToFloat(binary)
    % Convert binary representation to a floating-point number
    decimal = typecast(uint32(bin2dec(char(arrayfun(@(x) num2str(x), binary)))), 'single');
end