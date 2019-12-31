clear all;
close all;

% ����һ��phantomͼ�񣬿����������ߵ��������ֲ������
P = phantom(512);
figure, imshow(P)

theta = 0:180;
[R_512, xp] = radon(P, theta);
figure, imagesc(theta, xp, R_512)
xlabel('Parallel Rotation Angle - \theta (degrees)');
ylabel('Parallel Sensor Position - x\prime (pixels)');

% ����һ����ͼ�񣬿����������ߵ��������ֲ������
f=zeros(256);
i = [23;103;254]; j = [11;124;252];
f(sub2ind(size(f), i, j))=1;
figure, imshow(f);

theta = 0:180;
[R_256, xp] = radon(f, theta);
figure, imagesc(theta, xp, R_256)
xlabel('Parallel Rotation Angle - \theta (degrees)');
ylabel('Parallel Sensor Position - x\prime (pixels)');
