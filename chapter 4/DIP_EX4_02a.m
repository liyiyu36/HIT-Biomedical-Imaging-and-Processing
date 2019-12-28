
%% 例4.2 空间域滤波和频域滤波的比较 f = im2double(f)
clc
clear
f = imread('.\images_ch04\Fig0409(a)(bld).tif');
%imfinfo(f)
figure,imshow(f)
title('原始图像')

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
figure,imshow(S)
title('傅立叶频谱图像')

f = im2double(f); % 转换为
F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
%imfinfo(S)
figure,imshow(S)
title('使用 f = im2double(f) 之后再进行处理的傅立叶频谱图像')
 
