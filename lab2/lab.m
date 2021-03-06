clear all;
close all;

I = imread('body.tif');
I = im2double(I);
I = rgb2gray(I);

figure;
subplot(2, 4, 1), imshow(I);
title('The Original Pic0');

% Laplace Transform
k1 = -fspecial('laplacian');
I1 = imfilter(I, k1, 'symmetric');
subplot(2, 4, 2), imshow(I1);
title('Laplacian Pic1');

% Original Pic + Laplace Pic
I2 = I + I1;
subplot(2, 4, 3), imshow(I2);
title('Pic2 = Pic0 + Pic1');

% Sobel Operator
kx = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
ky = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
gradx = filter2(kx, I, 'same');
gradx = abs(gradx);
grady = filter2(ky, I, 'same');
grady = abs(grady);
I3 = gradx + grady;
subplot(2, 4, 4), imshow(I3, []);
title('Sobel Pic3');

% Average Filtering
k2 = fspecial('average', 5);
I4 = imfilter(I3, k2);
subplot(2, 4, 5), imshow(I4);
title('Sobel Pic4 after Average Filtering');

% Multiply I2 and I4 element-wise
I5 = I2.*I4;
subplot(2, 4, 6), imshow(I5);
title('Pic5 = Pic2 * Pic4');

% Add I5 and I, it is a sharpen-needed image
I6 = I5 + I;
subplot(2, 4, 7), imshow(I6);
title('Pic6 = Pic5 + Pic0');

% Power Transformation
gamma = .5;
c = 1;
I7 = c.*I6.^gamma;
subplot(2, 4, 8), imshow(I7);
title('Power Transformation Pic7');