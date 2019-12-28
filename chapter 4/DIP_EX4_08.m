
%% 例4.8 将高频提升滤波和直方图均衡化结合起来 hpfilter histeq
clc
clear
f = imread('.\images_ch04\Fig0419(a)(chestXray_original).tif');
figure,imshow(f)
title('原始图像')
%imfinfo(f)

PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
HBW = hpfilter('btw',PQ(1),PQ(2),D0,2);
H = 0.5+2*HBW;
gbw = dftfilt(f,HBW);
% 使用了 gscale(gbw) 之后，figure,imshow(gbw) 等价于 figure,imshow(gbw,[])
gbw = gscale(gbw); 
figure,imshow(gbw,[])
title('高通滤波后的图像')
%imfinfo(gbw)

gbe = histeq(gbw,256);
figure,imshow(gbe,[])
title('高通滤波并经过直方图均衡化后的图像')
%imfinfo(gbe)

ghf = dftfilt(f,H);
ghf = gscale(ghf);
figure,imshow(ghf,[])
title('高频提升滤波后的图像')
%imfinfo(ghf)

ghe = histeq(ghf,256);
figure,imshow(ghe,[])
title('高频提升滤波并经过直方图均衡化后的图像')
%imfinfo(ghe)
