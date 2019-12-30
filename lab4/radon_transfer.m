clear all;
close all;

theta1 = 0:10:170;
[R1,xp] = radon(P,theta1);
num_angles_R1 = size(R1,2)			% ��ͬ����ת�����Ƕ�

theta2 = 0:5:175;
[R2,xp] = radon(P,theta2);
num_angles_R2 = size(R2,2)			% ��ͬ����ת�����Ƕ�

theta3 = 0:2:178;
[R3,xp] = radon(P,theta3);
num_angles_R3 = size(R3,2)			% ��ͬ����ת�����Ƕ�

% ����һ��	figure, plot(R3(:,1)), hold on 		%	����������ʲô��
			plot(R3(:,50))					%	����R3�д�ŵ���ʲô����


N_R1 = size(R1,1)
N_R2 = size(R2,1)
N_R3 = size(R3,1)					

P_128 = phantom(128);
[R_128,xp_128] = radon(P_128,theta1);
N_128 = size(R_128,1)

figure, imagesc(theta1,xp,R1)
colormap(hot)
colorbar
xlabel('Parallel Rotation Angle - \theta (degrees)');
ylabel('Parallel Sensor Position - x\prime (pixels)');

figure, imagesc(theta3,xp,R3)
colormap(hot)
colorbar
xlabel('Parallel Rotation Angle - \theta (degrees)');
ylabel('Parallel Sensor Position - x\prime (pixels)');