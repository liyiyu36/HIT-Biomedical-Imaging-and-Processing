%% ��4.3 dftuv ��������ʵ��Ƶ���˲�������������
clc
clear

[U,V] = dftuv(7,5);
% [U,V] = dftuv(8,5);

D = U.^2 + V.^2

fftshift(D)