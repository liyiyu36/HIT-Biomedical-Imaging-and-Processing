
%% ��4.2 �ռ����˲���Ƶ���˲��ıȽ� f = im2double(f)
clc
clear
f = imread('.\images_ch04\Fig0409(a)(bld).tif');
%imfinfo(f)
figure,imshow(f)
title('ԭʼͼ��')

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
figure,imshow(S)
title('����ҶƵ��ͼ��')

f = im2double(f); % ת��Ϊ
F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
%imfinfo(S)
figure,imshow(S)
title('ʹ�� f = im2double(f) ֮���ٽ��д���ĸ���ҶƵ��ͼ��')
 
