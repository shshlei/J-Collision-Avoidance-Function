clear all; close all; clc;

W = 1.942/2.0;
L = 2.8 + 0.96 + 0.929;
L = L/2.0;
AA = [L, W;L, -W;-L, -W;-L, W]';
theta = 35*pi/180;
T = [cos(theta) -sin(theta);
	 sin(theta) cos(theta)];
AA = T*AA;
A = AA;
A(1,:) = AA(1,:) + 1;
A(2,:) = AA(2,:) + 1;

width = 10;
height = 10;
for i = 1:1000
	x = width*(2*rand()-1);
	y = height*(2*rand()-1);
	theta = pi*(2*rand()-1);
	T = [cos(theta) -sin(theta);
		 sin(theta) cos(theta)];
	B = T*AA;
	B(1,:) = B(1,:) + x;
	B(2,:) = B(2,:) + y;
	
	[v1,x1,y1,z1,pa1,pb1]=J2(A, B);

	[v2,x2,y2,z2,pa2,pb2]=MMJ2(A, B);
	
	if abs(v1-v2) > 1e-6
		fprintf('error: The MMJ2 function is error\n');
		squareplot(A, 'b');
		hold on;
		squareplot(B, 'r');
		axis equal
		return;
	end
end