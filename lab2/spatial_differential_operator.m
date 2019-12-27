% 空域微分算子

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
% imagesc(C) 将数组 C 中的数据显示为一个图像，该图像使用颜色图中的全部颜色。C
% 的每个元素指定图像的一个像素的颜色。生成的图像是一个 m×n 像素网格，其中 m 和
% n 分别是 C 中的行数和列数。这些元素的行索引和列索引确定了对应像素的中心.
subplot(1, 2, 1), imagesc(i);
subplot(1, 2, 2), imagesc(IEl);
colormap('gray');