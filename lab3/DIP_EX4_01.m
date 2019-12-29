%% 例4.1 使用填充和不使用填充的滤波效果 lpfilter paddedsizeP85
clc
clear

f = imread('.\images_ch04\Fig0405(a)(square_original).tif');
f = im2double(f);
figure,imshow(f,[])
%imfinfo(f)
title('原始图像')

[M, N] = size(f);
F = fft2(f);  % max(F(:)) = 128000
figure,imshow(F,[])
%imfinfo(F)
title('傅立叶频谱（复数）图像')

sig = 10;
H = lpfilter('gaussian',M,N,sig); % max(H(:)) = 1
figure,imshow(1-H,[]) % 显示表明滤波器图像未置中
title('滤波器频谱（取反）图像')

G = H.*F;
g = real(ifft2(G));
figure,imshow(g,[])
title('不使用填充的频域低通滤波处理后的图像')

PQ = paddedsize(size(f)); % size(f)=[256 256]
Fp = fft2(f, PQ(1),PQ(2));
Hp = lpfilter('gaussian',PQ(1),PQ(2),2*sig); % PQ=[512 512]
figure,imshow(fftshift(Hp),[])
Gp = Hp.*Fp;
gp = real(ifft2(Gp));
figure,imshow(gp,[])
title('使用填充的频域低通滤波处理后的图像')

gpc = gp(1:size(f,1),1:size(f,2));
figure,imshow(gpc,[])
title('使用填充的频域低通滤波处理后的（截取原始大小）图像')
%imfinfo(gpc)

h = fspecial('gaussian',15,7);
gs = imfilter(f,h);
figure,imshow(gs,[])
title('使用空间滤波器处理后的图像')
%imfinfo(gs)
