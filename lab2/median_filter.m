% median filter

I = imread('old_lena_gray.tif');
% J = imnoise(I, 'salt & pepper', d); adds salt and pepper noise, where d
% is the noise density, whose default value is 0.05. This approximately
% affects d*numel(I) pixels.
J = imnoise(I, 'salt & pepper', 0.02);          % 'gaussian', 'localvar', 'poisson', 'salt & pepper', 'speckle'
% J = medfilt2(I) performs median filtering of the image I in two
% dimensions. Each output pixel contains the median value in a 3-by-3
% neighbourhood around the corresponding pixel in the input image.
K = medfilt2(J);
% imshow(J), figure, imshow(K);

subplot(2, 3, 1), imshow(I);
Isp = imnoise(I, 'salt & pepper', 0.03);
subplot(2, 3, 2), imshow(Isp);
Ig = imnoise(I, 'gaussian', 0.02);
subplot(2, 3, 3), imshow(Ig);
% Im = medfilt2(Isp);
% subplot(2, 3, 4), imshow(Im);
% Im2 = medfilt2(Ig);
% subplot(2, 3, 5), imshow(Im2);

Im = medfilt2(I, [3 3]);            % Apply to original image
Ispm = medfilt2(Isp, [3 3]);        % Apply to salt and pepper image
Igm = medfilt2(Ig, [3 3]);          % Apply to Gaussian iamge
subplot(1, 3, 1), imshow(Im);
title('Meidian Filtering of Original Image');
subplot(1, 3, 2), imshow(Ispm);
title('Median Filtering of Salt & Pepper Image');
subplot(1, 3, 3), imshow(Igm);
title('Median Filtering of Gaussian Image');





