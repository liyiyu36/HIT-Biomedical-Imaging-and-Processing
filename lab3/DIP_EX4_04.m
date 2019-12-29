%% 例4.4 低通滤波器 dftfilt dftuv
clc
clear
f = imread('.\images_ch04\Fig0413(a)(original_test_pattern).tif');
figure,imshow(f)
title('原始图像')

F1 = fft2(f); % 注意 F1 和 下面 F 的区别
figure,imshow(log(1+abs(fftshift(F1))),[])
title('傅立叶频谱图像')

PQ = paddedsize(size(f));
[U V] = dftuv(PQ(1),PQ(2));
D0 = 0.05*PQ(2);

F = fft2(f,PQ(1),PQ(2));
figure,imshow(log(1+abs(fftshift(F))),[])
title('傅立叶频谱图像')

H = exp(-(U.^2+V.^2)/(2*(D0^2)));
figure,imshow(fftshift(H),[])
title('高斯低通滤波器频谱图像')

g = dftfilt(f,H);
figure,imshow(g,[])
title('高斯低通处理后图像')

