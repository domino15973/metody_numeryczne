% problem 5.18 (**)
clear all; close all; clc;

% wczytanie oryginalnego obrazu
img = imread('Lena256.bmp');
figure; imshow(img); title('Oryginalny obraz');
[M,N]=size(img);

% tworzenie siatki punktów interpolacji
[X,Y] = meshgrid(1:M,1:N);
[Xi,Yi] = meshgrid( M/2-20 : 0.025 : M/2+20, N/2-20 : 0.025 : N/2+20 );

% interpolacja przy użyciu różnych metod
img1 = uint8( interp2( X,Y,double(img),Xi,Yi,'nearest') );
img2 = uint8( interp2( X,Y,double(img),Xi,Yi,'linear') );
img3 = uint8( interp2( X,Y,double(img),Xi,Yi,'spline') );
img4 = uint8( interp2( X,Y,double(img),Xi,Yi,'cubic') );

% zmniejszanie obrazu i interpolacja z powrotem
table = imresize(img, 0.5);
figure; imshow(table); title("Zmniejszony obraz");
[width,height] = size(table);
[W,H] = meshgrid(1:width,1:height);
[Wi,Hi] = meshgrid(1:0.5:width, 1:0.5:height);
imgResized = interp2(W,H, double(table),Wi,Hi,'nearest');
figure; imshow(uint8(imgResized)); title("Powiększony obraz");

% obliczanie błędu interpolacji
absError = 0;
error = 0;
for i=1:1:width
    for a=1:1:height
        absError = absError + (double(abs(img(i,a)) - double(imgResized(i,a))));
        error = error + (double(img(i,a)) - double(imgResized(i,a)));        
    end
end
absError / (width * height),
error,

% obliczanie rotacji dla interpolacji 
a = pi/6; % kąt rotacji
R = [ cos(a) -sin(a); sin(a) cos(a) ]; % macierz rotacji
for m=1:width
    for n=1:height
        work = R*[W(m,n); H(m,n)]; % rotacja współrzędnych (x,y)
        WR(m,n) = work(1,1); % podstawienie nowego x
        HR(m,n) = work(2,1); % podstawienie nowego y
    end
end

% obracanie i wykonanie interpolacji z powrotem
imgResizedRotated = interp2(W, H, double(table), WR, HR, 'linear');
imgResizedBack = interp2(W, H, double(imgResizedRotated), Wi, Hi, 'linear');
figure; subplot(111); imshow( uint8(imgResizedRotated) ); title("Obrócony i zmniejszony");
figure; subplot(111); imshow( uint8(imgResizedBack) ); title("Obrócony i interpolowany");

% wyświetlanie obrazów z różnymi metodami interpolacji
figure;
subplot(221); imshow( img1 ); title('Nearest');
subplot(222); imshow( img2 ); title('Linear');
subplot(223); imshow( img3 ); title('Spline');
subplot(224); imshow( img4 ); title('Cubic'); 

a = pi/6; % kąt rotacji
R = [ cos(a) -sin(a); sin(a) cos(a) ]; % macierz rotacji
for m=1:M
    for n=1:N
        work = R * [X(m,n); Y(m,n)]; % rotacja współrzędnych (x,y)
        XR(m,n) = work(1,1); % podstawienie nowego x
        YR(m,n) = work(2,1); % podstawienie nowego y
    end
end
imgR = interp2( X, Y, double(img), XR, YR, 'linear'); % interpolacja obróconego
figure; subplot(111); imshow( uint8(imgR) ); title('Obrócony obraz'); % wynik
[Xi,Yi]=meshgrid( 1 : 0.2 : M, 1 : 0.2 : N ); % zagęszczenie punktów
imgRi = interp2( X,Y,imgR,Xi,Yi,'linear'); % interpolacja - poprawa jakości
figure; imshow( uint8(imgRi) ); title('Obrócony z poprawioną jakością'); % wynik

% obliczanie błędu dla obróconego i interpolowanego obrazu
rotatedAbsError = 0;
rotatedError = 0;
cells = 0;
for a=1:255
    for b=1:255
        if not(isnan(imgR(a,b))) && not(isnan(imgResizedBack(a,b)))
            rotatedAbsError = absError + (double(abs(imgR(a,b)) - double(imgResizedBack(a,b))));
            rotatedError = error + (double(imgR(a,b)) - double(imgResizedBack(a,b)));
            cells = cells+1;
        end
    end
end
rotatedAbsError/cells,
rotatedError,

% function retTable = myError(image)
%     half_x = image(1:2:256,:); half_y = image(:,1:2:256);
%     Missing = image(2:2:255, 2:2:255);
%     [Xi,Yi] = meshgrid(0,256);
%     griddata(Xi,Yi,Missing,)
% end