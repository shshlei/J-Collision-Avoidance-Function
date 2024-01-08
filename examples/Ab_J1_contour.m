clear all; close all; clc;

A=[eye(2) -eye(2)];

A(1,1) = 2;
A(1,3) = -2;
A(2,4) = -0.1;
%A = [1, -1, -1, 1; 1,  1, -1, -1];

B = [0.1 -0.1;
	 0.1 0.1];
v=MMMJ1(A, B); 

b = [0.1; 0.1];
[v1, x1, z1, pa1]=J1(A, b);
[v2, x2, z2, pa2]=MJ1(A, b);
[v3, x3, z3, z4, pa3]=MMJ1(A, b);

figure
squareplot(A, 'k');
hold on
scatter(b(1), b(2), 'k');
scatter(pa2(1), pa2(2), 'r');
scatter(pa3(1), pa3(2), 'b');

% x = -5:0.1:5;
% y = x;
% len = length(x);
% for i=1:len
% 	for j=1:len
% 		b=[x(i); y(j)];
% 		AA = A;
% 		if b(1) < 0
% 			b(1) = -b(1);
% 			AA(1, :) = -AA(1, :);
% 		end
% 		if b(2) < 0
% 			b(2) = -b(2);
% 			AA(2, :) = -AA(2, :);
% 		end		
% 		v=J1(AA, b);
% 		z(i, j)=v;
% 	end
% end
% z = round(z, 4);
% 
% dlmwrite('j1x4.txt', x, 'delimiter', ' ');
% dlmwrite('j1y4.txt', y, 'delimiter', ' ');
% dlmwrite('j1z4.txt', z, 'delimiter', ' ');

% p1 = [0; 1.1];
% p2 = [1.1; 0];
% s  = linspace(0, 1, 101);
% 
% for i = 1:length(s)
% 	b = (1 - s(i)) * p1 + s(i) * p2;
% 	v(i) = J1(A, b);
% 	%[v1(i), x, z]=MJ1(A, b);
% 	[v2(i), x, z]=MMJ1(A, b);
% end
% 
% figure
% plot(s, v, 'r');
% hold on
% %plot(s, v1, 'b');
% hold on
% plot(s, v2, 'g');
% axis equal
% title('Ab-J1');

% [b1, b2]=meshgrid(-5:0.1:5);
% len=size(b1,1);
% tic
% for i=1:len
% 	for j=1:len
% 		b=[b1(i,j); b2(i,j)];
% 		AA = A;
% 		if b(1) < 0
% 			b(1) = -b(1);
% 			AA(1, :) = -AA(1, :);
% 		end
% 		if b(2) < 0
% 			b(2) = -b(2);
% 			AA(2, :) = -AA(2, :);
% 		end		
% 		v=J1(AA, b);
% 		z(i,j)=v;
% 	end
% end
% toc
% 
% z = round(z, 4);
% figure,contour(b1, b2, z, 30);
% axis equal
% title('Ab-J1');