%% 例4.6 高通滤波器 hpfilter 高通
clc
clear

H = fftshift(hpfilter('ideal',500,500,100)); % 半径是100
% H = fftshift(hpfilter('gaussian',500,500,50));
% H = fftshift(hpfilter('btw',500,500,50));

mesh(H(1:10:500,1:10:500))
axis([0 50 0 50 0 1])

colormap([0 0 0])
axis off
grid off

figure,imshow(H,[])
