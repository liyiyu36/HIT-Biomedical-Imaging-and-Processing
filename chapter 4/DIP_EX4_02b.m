

%% ��4.2 freqz2 P90 ��ǿ��ֱ��Ե sobel  H = freqz2(h,PQ(1),PQ(2)); % �������˲���ԭ���ھ������Ĵ�
clc
clear
f = imread('.\images_ch04\Fig0409(a)(bld).tif');
figure,imshow(f)

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
figure,imshow(S)

h = fspecial('sobel')'; % ��ǿ��ֱ��Ե
%      1     0    -1
%      2     0    -2
%      1     0    -1
figure,freqz2(h); % uses [n2 n1] = [64 64].
% size_h = size(temp)

PQ = paddedsize(size(f));
H = freqz2(h,PQ(1),PQ(2)); % �������˲���ԭ���ھ������Ĵ�
H1 = ifftshift(H); % Ǩ��ԭ�㵽���Ͻ�
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
