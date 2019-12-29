clear all;
close all;

f = imread('Fig0409(a)(bld).tif');
F = fft2(double(f));
S = fftshift(log(1+abs(F)));
S = gscale(S);
subplot(121);imshow(f);
title('the original image');
subplot(122);imshow(S);
title('the Fourier spectrum after scaled');

h = fspecial('sobel')';     %generate the vertical Sobel mask
PQ = paddedsize(size(f));
H = freqz2(h, PQ(1), PQ(2)); % generate the equivalent object of Sobel operator in frequency domain
H1 = ifftshift(H);         % shift the origin of frequency filter to top-left of frequency rectangle
figure;
subplot(221);
mesh(abs(H(1:20:end, 1:20:end)));
axis off;
title('(a)the perspective plot of corresponding frequency filter');
subplot(222);
mesh(abs(H1(1:20:end, 1:20:end)));
axis off;
title('(b)the frequency filter with its origin located at the top-left of frequency rectangle');
subplot(223);
imshow(abs(H),[]);
title('the image form of figure(a)');
subplot(224);
imshow(abs(H1),[]);
title('the image form of figure(b)');

% generate the filtered image in the spatial and frequency domain, respectively
gs = imfilter(double(f), h);
gf = dftfilt(f, H1);
figure;
subplot(221);imshow(gs, []);
title(' the filtered image in the spatial domain')
subplot(222);imshow(gf, []); 
title(' the filtered image in the frequency domain')% note the gray tonality in this two images due to the negative value of gs and gf.
 
% show the absolute value of the two response gs and gf, which is more
% relevant to the verticle edges of images.
subplot(223);imshow(abs(gs), []); 
title(' the absolute value of filtered image (spatial method)');
subplot(224);imshow(abs(gf), []);
title(' the absolute value of filtered image (frequency method))');
 
% threshold value processing for creating a binary image seen more clearly
figure;
subplot(121);imshow(abs(gs) > 0.2*abs(max(gs(:))));
title('binary image of spatial-filtered image')
subplot(122);imshow(abs(gf) > 0.2*abs(max(gf(:))));
title('binary image of frequency-filtered image')
 
% compute the result difference of two processing in different domain.
d = abs(gs - gf);
max(d(:))