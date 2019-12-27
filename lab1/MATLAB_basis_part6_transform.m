I = imread('old_lena_color_512.tif');
figure,
hnorm = imhist(I)/numel(I);

% B = cumsum(A) returns the cumulative sum of A starting at the beginning
% of the first arraydimension in A whose size does not equal to 1
cdf = cumsum(hnorm);

% linspace(x1, x2, n) generates n points. The spacing between the points is
% (x2 - x1)/(n - 1)
x = linspace(0, 1, 256);
plot(x, cdf);
% axis(limits) specifies the limits for the current axes. Specifiy the
% limits as vector of four, six, or eight elements.
axis([0 1 0 1]);
set(gca, 'xtick', 0:.2:1);
set(gca, 'ytick', 0:.2:1);
xlabel('Input Intensity Values', 'fontsize', 9);
ylabel('Output Intensity Values', 'fontsize', 9);
text(0.18, 0.5, 'Transformation Function', 'fontsize', 9);