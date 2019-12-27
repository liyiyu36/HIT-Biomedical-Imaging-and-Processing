% fspecial()的使用
% help fspecial;                                % create predefined 2-D filter

% imfilter()的使用
% help imfilter;                                % N-D filtering of multidimensional images

clear all;
close all; 

f = imread('lena_color_512.tif');
f1 = im2double(f);

% Sobel filter
h1 = fspecial('sobel');                         % h1 = [1, 2, 1; 0, 0, 0; -1, -2, -1]
% figure;
% imshow(h1);

g1 = imfilter(f1, h1);
subplot(1, 3, 1);imshow(f);
title('The Original Image');

subplot(1, 3, 2);imshow(g1);
title('The Sobel Gradient');

b1 = mat2gray(g1);
subplot(1, 3, 3);imshow(b1);
title('The Gray-Scale Sobel Gradient');



% Average filter
h20 = fspecial('average');                      % h2 = [1/9, 1/9, 1/9; 1/9, 1/9, 1/9; 1/9, 1/9, 1/9]
h2 = fspecial('average', 5);                    % h22 = [1/25=0.04]5x5

g2 = imfilter(f1, h2);
figure(2);

subplot(1, 2, 1); imshow(f1);
title('The Original Image');

subplot(1, 2, 2); imshow(g2);
title('The Smoothed Gradient Image');