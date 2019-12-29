%% ��4.1 ʹ�����Ͳ�ʹ�������˲�Ч�� lpfilter paddedsizeP85
clc
clear

f = imread('.\images_ch04\Fig0405(a)(square_original).tif');
f = im2double(f);
figure,imshow(f,[])
%imfinfo(f)
title('ԭʼͼ��')

[M, N] = size(f);
F = fft2(f);  % max(F(:)) = 128000
figure,imshow(F,[])
%imfinfo(F)
title('����ҶƵ�ף�������ͼ��')

sig = 10;
H = lpfilter('gaussian',M,N,sig); % max(H(:)) = 1
figure,imshow(1-H,[]) % ��ʾ�����˲���ͼ��δ����
title('�˲���Ƶ�ף�ȡ����ͼ��')

G = H.*F;
g = real(ifft2(G));
figure,imshow(g,[])
title('��ʹ������Ƶ���ͨ�˲�������ͼ��')

PQ = paddedsize(size(f)); % size(f)=[256 256]
Fp = fft2(f, PQ(1),PQ(2));
Hp = lpfilter('gaussian',PQ(1),PQ(2),2*sig); % PQ=[512 512]
figure,imshow(fftshift(Hp),[])
Gp = Hp.*Fp;
gp = real(ifft2(Gp));
figure,imshow(gp,[])
title('ʹ������Ƶ���ͨ�˲�������ͼ��')

gpc = gp(1:size(f,1),1:size(f,2));
figure,imshow(gpc,[])
title('ʹ������Ƶ���ͨ�˲������ģ���ȡԭʼ��С��ͼ��')
%imfinfo(gpc)

h = fspecial('gaussian',15,7);
gs = imfilter(f,h);
figure,imshow(gs,[])
title('ʹ�ÿռ��˲���������ͼ��')
%imfinfo(gs)
