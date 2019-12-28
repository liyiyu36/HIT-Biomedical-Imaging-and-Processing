

%% 例4.2 freqz2 P90 增强垂直边缘 sobel  H = freqz2(h,PQ(1),PQ(2)); % 产生的滤波器原点在矩阵中心处
clc
clear
f = imread('.\images_ch04\Fig0409(a)(bld).tif');
figure,imshow(f)

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
figure,imshow(S)

h = fspecial('sobel')'; % 增强垂直边缘
%      1     0    -1
%      2     0    -2
%      1     0    -1
figure,freqz2(h); % uses [n2 n1] = [64 64].
% size_h = size(temp)

PQ = paddedsize(size(f));
H = freqz2(h,PQ(1),PQ(2)); % 产生的滤波器原点在矩阵中心处
H1 = ifftshift(H); % 迁移原点到左上角
figure,mesh(abs(H1(1:20:1200,1:20:1200)))

figure,imshow(abs(H),[])
figure,imshow(abs(H1),[])

gs = imfilter(double(f),h);
gf = dftfilt(f,H1);

figure,imshow(gs,[])
figure,imshow(gf,[])

figure,imshow(abs(gs),[])
figure,imshow(abs(gf),[])

figure,imshow(abs(gs) > 0.2*abs(max(gs(:))))
figure,imshow(abs(gf) > 0.2*abs(max(gf(:))))


d = abs(gs-gf);
max(d(:))
min(d(:))
