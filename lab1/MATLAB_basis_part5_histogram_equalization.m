f = imread('old_lena_color_512.tif');

subplot(221); imshow(f);
title("The original image");

subplot(222); imhist(f);
ylim('auto');                               % �Զ�����y������޺�����

g = histeq(f, 256);                         % ֱ��ͼ���⻯ histogram equalization���������ӶԱȶ�
subplot(223); imshow(g);
title('image after equalization');

subplot(224); imhist(g);
ylim('auto');