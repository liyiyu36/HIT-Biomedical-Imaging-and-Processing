clear all;
close all;

[op, map] = imread('lena_color_512.tif');
gp = rgb2gray(op);
% make a copy
np = gp;

% threshold
t = 8;

[height, width] = size(np);

% ��ǰ�����ص��뵱ǰ���ص���ҡ��¡����½ǵ�����ֵ��ƽ���͵�����֮һ���бȽϣ�
% �����ֵ����ָ������ֵt����֤����ɫ�������أ������жϳ��õ�����������ʱ���ú�
% ��0�����������������������Ϊ��ɫ��255
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