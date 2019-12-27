% Display a pseudocolor image in which all values less than 50% maximum are
% in shades of blue and values above are in shades of red.

clear all;
close all;

frame = 17;

% ����ͼ����һ�ְ�����ֱֵ����ΪRGB��ɫ���±��ͼ������ͼ��ɰ�����ֵ��ֱ��ӳ
% �䡱Ϊ��ɫ����ֵ��һ������ͼ����һ�����ݾ���data��һ����ɫ�����map�����ݾ���
% ������uint8��uint16��˫�������͵ģ�����ɫ�����������һ��mx3��˫���Ⱦ���
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