clear all;
close all;

img = imread('selfie.jpg');
m = size(img, 1);
n = size(img, 2);

img_up = imresize(img, [floor(m * 0.5), n]);
img_down = imrotate(img, 180);

r = img_down(:, :, 1);
g = img_down(:, : ,2);
b = img_down(:, :, 3);

for i = 1: m
    for j = 1: n
        rr(i, n - j + 1) = r(i, j);
        gg(i, n - j + 1) = g(i, j);
        bb(i, n - j + 1) = b(i, j);
    end
end

A(:, :, 1)=rr;
A(:, :, 2)=gg;
A(:, :, 3)=bb;

m1 = size(img_down, 1);
n1 = size(img_down, 2);
r1 = img_down(:, :, 1);
g1 = img_down(:, :, 2);
b1 = img_down(:, :, 3);

for i = 2: m1 - 10
    for j = 2: n1 - 10
        k = rand(1) * 10;
        di = i + round(mod(k, 33));
        dj = j + round(mod(k, 33));
        rr1(i, j) = r1(di, dj);
        gg1(i, j) = g1(di, dj);
        bb1(i, j) = b1(di, dj);
    end
end

A1(:, :, 1)=rr1;
A1(:, :, 2)=gg1;
A1(:, :, 3)=bb1;

img_down = imresize(A1, [floor(m * 0.5), n]);
A=[img_up; img_down];

figure;
subplot(1, 2, 1), imshow(img);
title('Original Image');
subplot(1, 2, 2), imshow(A);
title('Reflection');