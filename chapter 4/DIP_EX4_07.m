%% 例4.7 高通滤波
clc
clear

f = imread('.\images_ch04\Fig0413(a)(original_test_pattern).tif');
figure,imshow(f)
title('原始图像')

PQ = paddedsize(size(f));

D0 = 0.05*PQ(1); % 半径是 D0
H = hpfilter('gaussian',PQ(1),PQ(2),D0);
g = dftfilt(f,H);
figure,imshow(g,[])
title('高斯高通滤波后的图像')

