clear all;
close all;

P = phantom(128);
R = radon(P,0:179);
I1 = iradon(R,0:179,'linear','none');
I2 = iradon(R,0:179);
figure, 
subplot(1,3,1), imshow(P), title('Original')
subplot(1,3,2), imshow(I1,[]), title('Unfiltered backprojection')
subplot(1,3,3), imshow(I2,[]), title('Filtered backprojection')

% 自己调试一下采用不同的滤波器的重建效果差异
subplot(1,3,1), imshow(P), title('Original')
subplot(1,3,2), imshow(iradon(R,0:179,'Ram-Lak'),[]), title('R-L filtered backprojection')
subplot(1,3,3), imshow(iradon(R,0:179,'Shepp-Logan'),[]), title('S-L filtered backprojection')

% 自己找个简单图像重建试试
C = imread('cameraman.tif');
RC = radon(C,0:179);
figure,subplot(1,3,1), imshow(C,[]), title('Original')
subplot(1,3,2), imshow(iradon(RC,0:179,'Ram-Lak'),[]), title('R-L filtered backprojection')
subplot(1,3,3), imshow(iradon(RC,0:179,'Shepp-Logan'),[]), title('S-L filtered backprojection')