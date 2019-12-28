%% ��4.6 ��ͨ�˲��� hpfilter ��ͨ
clc
clear

H = fftshift(hpfilter('ideal',500,500,100)); % �뾶��100
% H = fftshift(hpfilter('gaussian',500,500,50));
% H = fftshift(hpfilter('btw',500,500,50));

mesh(H(1:10:500,1:10:500))
axis([0 50 0 50 0 1])

colormap([0 0 0])
axis off
grid off

figure,imshow(H,[])
