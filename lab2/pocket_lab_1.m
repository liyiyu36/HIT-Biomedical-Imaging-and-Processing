clear all;
close all;

N = 400;                                            % Vertical and Horizontal size
Ny_cyc = 4;                                         % Produce 4 cycle grating

x = (1: N) * Ny_cyc / N;
I_sin(1, :) = 0.5 * sin(2 * pi * x) + 0.5;
I_8 = im2uint8(I_sin);                              % Convert to a uint8 vector

for i = 1: N                                        % Extend to N(400) vertical lines
    I(i, :) = I_8;
end

figure, imshow(I);
title('Sinewave Grating');

% mesh(Z) creates a mesh plot and uses the column and row indices of the
% elements in Z as the x- and y- coordinates
figure, mesh(double(I));                            % 3-D display of the image
a = imread('old_lena_gray.tif');