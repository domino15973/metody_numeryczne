% problem 8.1 (*)
clear all; close all; clc;

% evd_pca.m
% Separacja zrodel - nagrania
[y1,fpr1]=audioread('nagrania/mix1.mp3');    y1=y1(:,1)';  % wczytaj nagrania z dwoch mikrofonow
[y2,fpr2]=audioread('nagrania/muzyka1.mp3'); y2=y2(:,1)';  % tylko pierwszy kanal, zmien kierunek
size(y1), size(y2), pause                                  % pokaz wymiary wektorow
  
N = min( length(y1), length(y2) ),      % dlugosc krotszego nagrania
n = 1:N; y1=y1(1:N); y2=y2(1:N);        % pozostaw taka sama liczbe probeka 
figure;
subplot(211); plot(n,y1); title('y1(n)'); grid;   % pokaz oba 
subplot(212); plot(n,y2); title('y2(n)'); grid;   % nagrania
%soundsc(y1,fpr1), pause                 % odsluchaj oba 
%soundsc(y2,fpr2), pause                 % nagrania

% Separacja zrodel
C1 = cov( y1, y2 ),                   % macierz kowariancji Matlaba
y12 = [ y1-mean(y1); y2-mean(y2) ];   % odjecie wartosci srednich
C2 = y12 * y12'/N,                    % macierz kowariancji Nasza
pause
C = C2;  % C = C1 albo C2             % wybor macierzy
[V,D] = eig(C2), pause                % dekompozycja EVD
xe = V' * [ y1; y2 ];                 % PCA - rzutowanie na wektory wlasne

% D - macierz diagonalna wartości własne
% V - macierz kwadratowa z wektorami własnymi
 
% Wynik separacji  
figure;
subplot(211); plot(n,xe(1,:),'b'); title('x1est(n)'); grid;
subplot(212); plot(n,xe(2,:),'b'); title('x2est(n)'); grid;
%soundsc(xe(1,:),fpr1), pause
%soundsc(xe(2,:),fpr2), pause
 
% ------------------------------------------------------------------------

[y3,fpr3] = audioread("nagrania/mix2.mp3");    y3=y3(:,1)';
[y4,fpr4] = audioread('nagrania/muzyka2.mp3'); y4=y4(:,1)';
size(y3), size(y4), pause                   % pokaz wymiary wektorow
  
N = min( length(y3), length(y4) ),      % dlugosc krotszego nagrania
n = 1:N; y3=y3(1:N); y4=y4(1:N);        % pozostaw taka sama liczbe probeka 
figure;
subplot(211); plot(n,y3); title('y3(n)'); grid;   % pokaz oba
subplot(212); plot(n,y4); title('y4(n)'); grid;   % nagrania 
%soundsc(y3,fpr3), pause                 % odsluchaj oba 
%soundsc(y4,fpr4), pause                 % nagrania

% Separacja zrodel
C1 = cov( y3, y4 ),                   % macierz kowariancji Matlaba
y34 = [ y3-mean(y3); y4-mean(y4) ];   % odjecie wartosci srednich
C2 = y34 * y34'/N,                    % macierz kowariancji Nasza
pause
C = C2;  % C = C1 albo C2             % wybor macierzy
[V,D] = eig(C2), pause                % dekompozycja EVD
xe = V' * [ y3; y4 ];                 % PCA - rzutowanie na wektory wlasne
  
% Wynik separacji  
figure;
subplot(211); plot(n,xe(1,:),'b'); title('x3est(n)'); grid;
subplot(212); plot(n,xe(2,:),'b'); title('x4est(n)'); grid;
%soundsc(xe(1,:),fpr3), pause
%soundsc(xe(2,:),fpr4), pause
 