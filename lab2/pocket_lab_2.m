% Display a pseudocolor image in which all values less than 50% maximum are
% in shades of blue and values above are in shades of red.

clear all;
close all;

frame = 17;

% 索引图像是一种把像素值直接作为RGB调色板下标的图像。索引图像可把像素值“直接映
% 射”为调色板数值。一幅索引图包含一个数据矩阵data和一个调色板矩阵map，数据矩阵
% 可以是uint8，uint16或双精度类型的，而调色板矩阵则总是一个mx3的双精度矩阵。
[I(:, :, 1, 1), map] = imread('mri.tif', frame);

if isempty(map) == 0                    % Check to see if indexed data
    I = ind2gray(I, map);               % If so, convert to indensity image
end

I = im2double(I);                       % Convert to double
[M, N] = size(I);
RGB = zeros(M, N, 3);                   % Initialize RGB array
for i = 1: M
    for j = 1: N                        % Fill RGB planes
        if I(i, j) > 0.5
            RGB(i, j, 1) = (I(i, j) - 0.5) * 2;
        else
            RGB(i, j, 3) = I(i, j) * 3;
        end
    end
end

figure;
subplot(1, 2, 1), imshow(I)
title('The Original Image');
subplot(1, 2, 2), imshow(RGB);
title('The Pseudocolor Image');