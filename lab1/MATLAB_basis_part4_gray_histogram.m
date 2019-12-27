% Experiment 1: Calculate the histogram of gray-scale throughout
% gray-scale area

% Function
f = imread('old_lena_gray.jpg');
[m, n] = size(f);
myhist = zeros(1, 256);

% Compute the area under certain gray level
for k = 0: 255
    ind = find(f == k);
    myhist(k + 1) = length(ind);
end

figure,

subplot(131); imshow(f);
title('Gray-Scale Lena');

% йтр╩об myhist = myhist/numel(f);
subplot(132);stem([1:1:256], myhist, '.');
axis([1 256 0 max(myhist)]);
title('Histograms of myhist');

subplot(133); imhist(f);
axis([1 256 0 max(imhist(f))]);
title('Histograms by "imhist" function');