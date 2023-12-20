% problem 9.2.1 (**) - metoda bisekcji
clear all; close all; clc;

it = 12;
a  = pi - pi/5; 
b  = pi + pi/5;             % znajdz zero funkcji y=sin(x) dla x=pi

f  = @(x) sin(x);           % funkcja
df = @(x) cos(x);           % pochodna

x = 0 : 0.01 : 2*pi;
figure; plot( x, f(x), 'b-', x, df(x),'r-'); grid; xlabel('x'); title('f(x), fp(x)');
legend('Funkcja','Jej pochodna');

bisection = nonlinsolvers( f, df, a, b, 'bisection', it )
figure; plot( 1:it , bisection, "bo-"); xlabel('iter'); title('c(iter)')
grid on, legend('Bisection');

pause;


while (abs(pi - bisection(end))) > 0.00001 * pi 
    it = it + 1;
    bisection = nonlinsolvers( f, df, a, b, 'bisection', it );
end

disp("Liczba iteracji potrzebnych by oszacowac z dokladnoscia : " + it);
disp("Oszacowane miejsce zerowe: " + bisection(end))

figure; plot( 1:it , bisection, "go-"); xlabel('iter'); title('c(iter)')
grid on, legend('Bisection');