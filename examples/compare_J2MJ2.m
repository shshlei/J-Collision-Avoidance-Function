clear all; close all; clc;

W = 1.942/2.0;
L = 2.8 + 0.96 + 0.929;
L = L/2.0;
A = [L, W;L, -W;-L, -W;-L, W]';

t1_total = 0.0;
t2_total = 0.0;
for i=1:1000
	x = 10*(2*rand()-1);
	y = 10*(2*rand()-1);
	theta = pi*(2*rand()-1);
	T = [cos(theta) -sin(theta);
		 sin(theta) cos(theta)];
	AA = T*A;
	AA(1,:) = AA(1,:) + x;
	AA(2,:) = AA(2,:) + y;
	
	x = 10*(2*rand()-1);
	y = 10*(2*rand()-1);
	theta = pi*(2*rand()-1);
	T = [cos(theta) -sin(theta);
		 sin(theta) cos(theta)];
	B = T*A;
	B(1,:) = B(1,:) + x;
	B(2,:) = B(2,:) + y;
	
	tic;
	[v,x,y,z,pa,pb]=J2(A,B);
	t1 = toc;
	t1_total = t1_total+t1;
	
	c = 0.25 * sum(AA, 2);
	AA(1,:) = AA(1,:) - c(1);
	AA(2,:) = AA(2,:) - c(2);

	B(1,:) = B(1,:) - c(1);
	B(2,:) = B(2,:) - c(2);

	tic
	[v,x,y,z,pa,pb]=MJ2(AA,B);
	t2 = toc;
	t2_total = t2_total+t2;
end

delta1 = (t1_total-t2_total)/t1_total