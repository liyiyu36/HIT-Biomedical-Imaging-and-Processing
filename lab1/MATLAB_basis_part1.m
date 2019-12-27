% ͼ���ȡ
f = imread('old_lena_color_512.tif');    % �ֺ�����ʹ���н��������ڲ���ʾ

% ͼ��Ĵ�С
size(f); % 647 * 651��3ͨ��

% ͼ�����Ϣ
whos f;

% ͼ�����ϸ����Ϣ��imfinfo��ʾ����Ϣ��whose��
imfinfo('old_lena_color_512.tif');
imfinfo('lena_color_512.tif');

% ͼ�����ʾ
imshow('old_lena_color_512.tif');            % ͼƬ��uint8�洢�������ܴ洢����ֵ�����Χ����255��ʵ������ǿ������ת��

help imshow

% imshow()��ʾͼ��ʱ��double������Ϊ��0~1��Χ�ڣ�����1ʱ������ʾΪ��ɫ��
% ��imshow��ʾuint8��ʱ��0~255��Χ
% ����������ķ�Χ��0-255֮���double�����ݾͱ�����������ʾΪ��ɫͼ����
cd = double(f);
imshow(f), figure, imshow(cd)   % �����һ�Ŵ���ɫ��ͼƬ����Ϊ��ֵ������Խ����1�Ľ���
figure, imshow(cd/255);         % �����ԭͼһ������Ϊcd/255��0-255��uint8��ֵӳ�䵽��double��0-1֮��
figure, imshow(cd/512);         % �����ԭͼ��������Ϊcd/512��ӳ�䵽��0-0.5֮��
figure, imshow(cd/128);         % �����ԭͼ��������Ϊcd/512��ӳ�䵽��0-2֮�䣬���в������1����ʾΪ��ɫ

cd = im2double(f);
% ��ͼ���Զ�ת����double���ͣ��Զ�/255
figure, imshow(cd)

c = [1 2 3
    4 5 6
    7 8 9];
figure, image(c)
image(c), truesize, axis off

% ͼ���д
imwrite(f, 'MRI.bmp', 'bmp')    % �о���ԭͼû��ʲô���𡣡�

help imwrite
