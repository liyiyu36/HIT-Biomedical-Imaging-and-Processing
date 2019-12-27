% ����΢������

I = imread('old_lena_gray.tif');
% edge(I, 'xxx'); I must be a gray sacle image. That is to say, matrix I
% must be a 2-D matrix.
IEr = edge(I, 'roberts');                       % Roberts edges
IEp = edge(I, 'prewitt');                       % Prewitt edges
IEs = edge(I, 'sobel');                         % Sobel edges
figure,
subplot(2, 2, 1), imshow(I);
title('Original Image');
subplot(2, 2, 2), imshow(IEr);
title('Roberts Edge');
subplot(2, 2, 3), imshow(IEp);
title('Prewitt Edge');
subplot(2, 2, 4), imshow(IEs);
title('Sobel Edge');

i = rgb2gray(imread('lena_color_512.tif'));
k = fspecial('laplacian');                      % create Laplacian filter
IEl = imfilter(double(i), k, 'symmetric');      % Laplacian edges
% imagesc(C) ������ C �е�������ʾΪһ��ͼ�񣬸�ͼ��ʹ����ɫͼ�е�ȫ����ɫ��C
% ��ÿ��Ԫ��ָ��ͼ���һ�����ص���ɫ�����ɵ�ͼ����һ�� m��n ������������ m ��
% n �ֱ��� C �е���������������ЩԪ�ص���������������ȷ���˶�Ӧ���ص�����.
subplot(1, 2, 1), imagesc(i);
subplot(1, 2, 2), imagesc(IEl);
colormap('gray');