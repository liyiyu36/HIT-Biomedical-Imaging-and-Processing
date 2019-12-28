%% ��4.4 ��ͨ�˲��� dftfilt dftuv
clc
clear
f = imread('.\images_ch04\Fig0413(a)(original_test_pattern).tif');
figure,imshow(f)
title('ԭʼͼ��')

F1 = fft2(f); % ע�� F1 �� ���� F ������
figure,imshow(log(1+abs(fftshift(F1))),[])
title('����ҶƵ��ͼ��')

PQ = paddedsize(size(f));
[U V] = dftuv(PQ(1),PQ(2));
D0 = 0.05*PQ(2);

F = fft2(f,PQ(1),PQ(2));
figure,imshow(log(1+abs(fftshift(F))),[])
title('����ҶƵ��ͼ��')

H = exp(-(U.^2+V.^2)/(2*(D0^2)));
figure,imshow(fftshift(H),[])
title('��˹��ͨ�˲���Ƶ��ͼ��')

g = dftfilt(f,H);
figure,imshow(g,[])
title('��˹��ͨ�����ͼ��')

