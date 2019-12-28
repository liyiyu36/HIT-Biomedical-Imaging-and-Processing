clear all;
close all;

[op, map] = imread('lena_color_512.tif');
gp = rgb2gray(op);
% make a copy
np = gp;

% threshold
t = 8;

[height, width] = size(np);

% 当前的像素点与当前像素点的右、下、右下角的像素值的平方和的三分之一进行比较，
% 如果差值大于指定的阈值t，就证明颜色跳变严重，可以判断出该点是轮廓。这时就用黑
% 点0把他描绘出来，否则把他设置为白色的255
dx = double(np(1: height - 1, 1: width - 1) - np(2: height, 1: width - 1));
dx(1: height, width) = 255;
dy = double(np(1: height - 1, 1: width - 1) - np(1: height - 1, 2: width));
dy(height, 1: width) = 255;
dp = double(np(1: height - 1, 1: width - 1) - np(2: height, 2: width));
dp(height, 1: width) = 255;
dp(1: height, width) = 255;
np(1: height, 1: width) = (sqrt(dx.*dx + dy.*dy + dp.*dp) < t) * 255;

n = 1;      % varient of Gaussian filter
k = 3;      % size of Gaussian filter

a2 = fspecial('gaussian', k, n);
fp = filter2(a2, np) / 255;

figure;
subplot(1, 2, 1), imshow(op);
title('Original Image');
subplot(1, 2, 2), imshow(fp);
title('Portraiture');