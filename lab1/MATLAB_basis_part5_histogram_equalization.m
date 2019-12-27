f = imread('old_lena_color_512.tif');

subplot(221); imshow(f);
title("The original image");

subplot(222); imhist(f);
ylim('auto');                               % 自动设置y轴的上限和下限

g = histeq(f, 256);                         % 直方图均衡化 histogram equalization，可以增加对比度
subplot(223); imshow(g);
title('image after equalization');

subplot(224); imhist(g);
ylim('auto');