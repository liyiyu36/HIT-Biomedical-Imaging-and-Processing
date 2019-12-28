clear all;
close all;

f = imread('f.tif');
% FFTN on values of class UINT8 is obesolete. Use FFTN(double(X)) or
% FFTN(single(X)) instead.
f1 = double(f);

F = fft2(f1);
% Compute the Fourier spectrum (equal to the square root of the sum of the
% squares of the real and imaginary parts)
S = abs(F);

figure;
subplot(2, 2, 1), imshow(f);
title('Original Image');
subplot(2, 2, 2), imshow(S, []);
title('Fourier Spectrum');

% Shifting the origin of DFT transform to the center of the frequency
% rectangle
Fc = fftshift(F);
subplot(2, 2, 3), imshow(abs(Fc), []);
title('Fourier Spectrum After Shifting');

% Gray-scale stretching by a log transformation
S2 = log(1 + abs(Fc));
subplot(2, 2, 4), imshow(S2, []);
title('Gray-Scale Stretching');