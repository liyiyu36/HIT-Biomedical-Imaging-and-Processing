%% ��4.7 ��ͨ�˲�
clc
clear

f = imread('.\images_ch04\Fig0413(a)(original_test_pattern).tif');
figure,imshow(f)
title('ԭʼͼ��')

PQ = paddedsize(size(f));

D0 = 0.05*PQ(1); % �뾶�� D0
H = hpfilter('gaussian',PQ(1),PQ(2),D0);
g = dftfilt(f,H);
figure,imshow(g,[])
title('��˹��ͨ�˲����ͼ��')

