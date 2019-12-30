clear all;
close all;

f = imread('Fig0413(a)(original_test_pattern).tif');
PQ = paddedsize(size(f));
[U, V] = dftuv(PQ(1), PQ(2));  % generating the meshgrid array needed for distance computation
D0 = 0.05*PQ(2);
F = fft2(double(f), PQ(1), PQ(2));
H = exp(-(U.^2+V.^2) / (2*(D0^2)));
g = dftfilt(double(f), H);
subplot(221); imshow(f, []);
title('the original image');
subplot(222); imshow(fftshift(H), []);  
title('the original image');
subplot(223); imshow(log(1 + abs(fftshift(F))), []);
title(' the Fourier spectrum of original image');
subplot(224); imshow(g, []);
title('the filtered image by Gaussian lowpass filter');