% problem 8.4 (***)
clear all; close all; clc;

% evd_jacobi.m
A = [ 2 0 1; 0 -2 0; 1 0 2 ], % przyklad z Yang, 2005
% A = hankel( [1 2 3], [3,4,5] ),
[N,N] = size(A),
% Pojedyncza rotacja zerujaca element A(p,q) macierzy A
p=1; q=3;
R1 = makeRi(p, q, A)
display("Macierz diagonalna");
display(R1.' * A * R1);

[R, D] = solve(A); 

display("Sprawdzenie");
display(R'*D*R);
 
A = [4 5 6 7;
     5 6 7 8;
     6 7 8 9;
     7 8 9 4;];

[R,D] = solve(A);

R'*D*R,

function [R, D] = solve(A) % R jako macierz rotacji , D jako macierz diagonalna
   D = A;
   [N, N] = size(D);
   R = eye(N);
   while (1)   %pętla do momentu gdy macierz D ma element do wyzerowania
       Dabs = abs(D - tril(D)); % macierz zawierajaca wartosci nad glowna przekatna
       [v, x, y] = mmax(Dabs); % znalezienie maksymalnej wartości macierzy oraz jej indeksów
       assert(Dabs(y, x) == v); %sprawdzenie czy przypadkiem x nie równe -1  
       % jeśli w macierzy D zostały jeszcze wartości nie wyzerowane
       if (abs(v) > 0.00000000001)
           Ri = makeRi(y, x, D);
           D = Ri.' * D * Ri;
           R = R * Ri;
       else
           return
       end
   end
end

%Funkcja znajdujące największą wartość w macierzy oraz jej indeksy
function [v, x, y] = mmax(A)
   [N, N] = size(A);
   [v, i] = max(A, [], 'all');  % znalezienie maksymalnych wartości w macierzy A
   % 'i' to jest numer elementu licząc kolumnami
   x = fix(i / N) + 1; % dzieli indeks jednowymiartowy przez liczbe kolumn co pozwala okreslic ile pelnych wierszy zostalo przeskoczone przez ten indeks
   % zwraca najblizsza liczbe calkowita w kierunku zera(obcina czesc
   % dziesietna) co odpowiada numerowi wiersza ktory zawiera dany indeks
   % jednowymiarowy + 1 bo matlab liczy od 1
   y = rem(i, N); % N liczba kolumn
   % Oblicza resztę z dzielenia i przez N. Jest to operacja modulo, która zwraca resztę z dzielenia i przez N, co oznacza, ile pozostało elementów w wierszu (po pełnych wierszach) na pozycji określonej przez indeks i
   if (x == 0)
       % ostatni element w kolumnie
       y = N;
       x = x - 1;
       return
   end
end

% funkcja z listingu 8.4
function [Ri] = makeRi(p, q, A)
   xi = (A(q,q) - A(p,p)) / 2 / A(p,q); % obliczanie xi
   if( xi > -eps )
       t =  (abs(xi) + sqrt(1 + xi^2)); % obliczanie t
   else
       t = -(abs(xi) + sqrt(1 + xi^2));
   end
  
   c = 1 / sqrt(1+t^2);
   s = t * c;
   [N, N] = size(A);
   Ri = eye(N);
   Ri(p, p) = c;
   Ri(q, q) = c;
   Ri(p, q) = -s;
   Ri(q, p) = s;
end