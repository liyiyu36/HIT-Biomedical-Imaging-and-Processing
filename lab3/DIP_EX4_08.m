
%% ��4.8 ����Ƶ�����˲���ֱ��ͼ���⻯������� hpfilter histeq
clc
clear
f = imread('.\images_ch04\Fig0419(a)(chestXray_original).tif');
figure,imshow(f)
title('ԭʼͼ��')
%imfinfo(f)

PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
HBW = hpfilter('btw',PQ(1),PQ(2),D0,2);
H = 0.5+2*HBW;
gbw = dftfilt(f,HBW);
% ʹ���� gscale(gbw) ֮��figure,imshow(gbw) �ȼ��� figure,imshow(gbw,[])
gbw = gscale(gbw); 
figure,imshow(gbw,[])
title('��ͨ�˲����ͼ��')
%imfinfo(gbw)

gbe = histeq(gbw,256);
figure,imshow(gbe,[])
title('��ͨ�˲�������ֱ��ͼ���⻯���ͼ��')
%imfinfo(gbe)

ghf = dftfilt(f,H);
ghf = gscale(ghf);
figure,imshow(ghf,[])
title('��Ƶ�����˲����ͼ��')
%imfinfo(ghf)

ghe = histeq(ghf,256);
figure,imshow(ghe,[])
title('��Ƶ�����˲�������ֱ��ͼ���⻯���ͼ��')
%imfinfo(ghe)
