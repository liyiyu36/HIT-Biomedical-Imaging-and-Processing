clear all;
close all;

f = imread('Fig0405(a)(square_original).tif');
[M, N] = size(f);
F = fft2(double(f));
sig = 10;
H = lpfilter('gaussian', M, N, sig);                % design a gaussian low-pass filter
G = H .* F;
g = real(ifft2(G));

figure;
subplot(1, 3, 1), imshow(f, []);
title('The Original Image');
subplot(1, 3, 2), imshow(g, []);
title('Filtered Image without Padding');

PQ = paddedsize(size(f));                           % padding the original image
Fp = fft2(f, PQ(1), PQ(2));
Fp = fft2(double(f), PQ(1), PQ(2));
Hp = lpfilter('gaussian',PQ(1), PQ(2), 2*sig);      % extend the filter by zero padding
Gp = Hp .* Fp;
gp = real(ifft2(Gp));
gpc = gp(1: size(f, 1), 1: size(f, 2));             % truncate the filtered image to make its size the same as input image
subplot(1, 3, 3), imshow(gpc, []);
title('Filtered Image with Padding');