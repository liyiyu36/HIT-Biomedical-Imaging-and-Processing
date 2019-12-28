%% Àý4.5 »æÖÆÏß¿òÍ¼ mesh lpfilter µÍÍ¨
clc
clear
H = fftshift(lpfilter('gaussian',500,500,50));
mesh(H(1:10:500,1:10:500))
axis([0 50 0 50 0 1])

% colormap([0 0 0])
% axis off
% grid off

figure,imshow(H,[])
