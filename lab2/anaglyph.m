clear all;
close all;

img = imread('selfie.jpg');

r = img(:, :, 1);
g = img(:, :, 2);
b = img(:, :, 3);

m = size(img, 1);
n = size(img, 2);

for i = 3: m - 2
    for j = 3: n - 2
        rr(i,j)=0.25*r(i-1,j-1)+0.25*r(i-2,j-2)+0.25*r(i,j)+0.25*r(i+1,j+1)-1.0*r(i+2,j+2)+128;
        gg(i,j)=0.25*r(i-1,j-1)+0.25*g(i-2,j-2)+0.25*g(i,j)+0.25*g(i+1,j+1)-1.0*g(i+2,j+2)+128;
        bb(i,j)=0.25*b(i-1,j-1)+0.25*b(i-2,j-2)+0.25*b(i,j)+0.25*b(i+1,j+1)-1.0*b(i+2,j+2)+128;
    end
end

A(:,:,1)=rr;
A(:,:,2)=gg;
A(:,:,3)=bb;

figure;
subplot(1, 2, 1), imshow(img);
title('Original Image');
subplot(1, 2, 2), imshow(A);
title('Anaglyph');