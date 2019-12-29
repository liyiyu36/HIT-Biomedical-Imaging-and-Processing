%% 例4.3 dftuv 建立用于实现频域滤波器的网格数组
clc
clear

[U,V] = dftuv(7,5);
% [U,V] = dftuv(8,5);

D = U.^2 + V.^2

fftshift(D)