% ��ɫͼ��ͻҶ�ͼ��Ƚ�
% lena = imread('lena_color_512.tif');
% whos
% imfinfo('lena_color_512.tif')
% figure, imshow(lena);

% �������ͼ�ת��
a1 = 5.0123456789;
a2 = 5.9876543211;
a3 = 5.5;
uint8(a1);
uint8(a2);
uint8(a3);
uint8(512.12345678910121);

% double()����ǿ��ת��Ϊdouble��
A1 = [0, 1, 2; 3, 4, 5; 6, 7, 8];
B1 = double(A1);

A2 = [-0.5 0.5
    0.75 1.5];
B2 = double(A2);
G2 = im2uint8(A2);
% figure, imshow(G2);

A3 = [128, 300; -12, 66.98];
G31 = mat2gray(A3, [0, 255]);
G32 = mat2gray(A3);              % mat2gray(A)��amin��amax��ΪA����Сֵ�����ֵ

% ��������
V = [1 2 3 4];
w = V';
w(1: end);
zeros(1, 4);
ones(2, 4);

% ���������
A4 = [1 2 3; 4 5 6];
A5 = rand(4, 4);
A6 = magic(5);                  % magic(n)����һ��n*n�ľ��󣬾���Ԫ��Ϊ��1��n^2����������ÿ��ÿ�еĺ���ȣ�n>=3
A = 5 * ones(3, 3);             % element-wise
A5(1, 2);
A5(:, 2: 4);
A5(1: 3, :);
A7 = [0 1 2 3
    2 3 4 5
    6 7 8 9];
sum(A7);                        % column-wise
A7(:);                          % flatten
sum(A7(:));                     % element-wise
A7';                            % reverse
sum(A7');                       % row-wise

max(A7);                        % column-wise
max(A7(:));                     % element-wise
max(A7');                       % row-wise

min(A7);                        % column-wise
min(A7(:));                     % element-wise
min(A7');                       % row-wise

% �����С
size(A7);
numel(A7);                      % number of array elements

reshape(A7, 1, numel(A7));      % reshape A7 to (1, numel(A7))
reshape(A7, 2, numel(A7)/2);    % reshape A7 to (2, numel(A7)/2)

% ����͵�������
save work.mat;
% help save;

clear all;                      % �����������
close all;                      % �ر����д���

load work.mat;                  % ���µ���ձ��������

% ����MATLAB�Դ���һЩ����
load mri;
figure,
montage(D, map)
title('Horizontal Slices');

% MATLAB���Դ��Ķϲ���Ƭģ��ͼ����������
P = phantom('Modified Shepp-Logan', 200);
imshow(P)
ph = phantom(256);
figure, imshow(ph)



















