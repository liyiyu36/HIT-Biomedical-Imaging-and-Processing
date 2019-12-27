% 图像读取
f = imread('old_lena_color_512.tif');    % 分号用于使运行结果在命令窗口不显示

% 图像的大小
size(f); % 647 * 651，3通道

% 图像的信息
whos f;

% 图像的详细及信息，imfinfo显示的信息比whose多
imfinfo('old_lena_color_512.tif');
imfinfo('lena_color_512.tif');

% 图像的显示
imshow('old_lena_color_512.tif');            % 图片以uint8存储，所以能存储的数值的最大范围就是255，实际上市强制类型转换

help imshow

% imshow()显示图像时对double型是认为在0~1范围内，大于1时都是显示为白色，
% 而imshow显示uint8型时是0~255范围
% 而经过运算的范围在0-255之间的double型数据就被不正常得显示为白色图像了
cd = double(f);
imshow(f), figure, imshow(cd)   % 结果是一张纯白色的图片，因为数值的类型越过了1的界限
figure, imshow(cd/255);         % 结果和原图一样，因为cd/255将0-255的uint8数值映射到了double的0-1之间
figure, imshow(cd/512);         % 结果比原图更暗，因为cd/512，映射到了0-0.5之间
figure, imshow(cd/128);         % 结果比原图更亮，因为cd/512，映射到了0-2之间，会有部分溢出1，显示为白色

cd = im2double(f);
% 把图像自动转换成double类型，自动/255
figure, imshow(cd)

c = [1 2 3
    4 5 6
    7 8 9];
figure, image(c)
image(c), truesize, axis off

% 图像的写
imwrite(f, 'MRI.bmp', 'bmp')    % 感觉和原图没有什么区别。。

help imwrite
